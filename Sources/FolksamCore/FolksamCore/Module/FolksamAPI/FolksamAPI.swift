//
//  APIService.swift
//  FolksamApp
//
//  Created by Johan Torell on 2021-01-28.
//
import Apollo

#if !os(macOS)
import UIKit

extension String: Error {}

public final class FolksamAPI {
    let baseURL: URL
    let apollo: ApolloClient
    var pool: Bool = false
    var transactionId: String = ""
    var pollResponse: PollResponse?
    let tokenService = TokenService()
    let mocked: Bool

    public init(withEnvironment env: APIEnvironment) {
        mocked = env == .mocked
        baseURL = env.baseURL
        apollo = ApolloService.createClient(withEnvironment: env, tokenService: tokenService)
    }

    func buildURL(path: String) -> URL {
        return baseURL.appendingPathComponent(path)
    }

    public func graphql<T: GraphQLMutation>(mutation: T, resultHandler: GraphQLResultHandler<T.Data>? = nil) {
        apollo.perform(mutation: mutation) { result in
            resultHandler?(result)
        }
    }

    public func graphql<T: GraphQLQuery>(query: T, resultHandler: GraphQLResultHandler<T.Data>? = nil) {
        apollo.fetch(query: query, cachePolicy: .returnCacheDataAndFetch) { result in
            resultHandler?(result)
        }
    }

    func pollRequest(transactionId: String) -> URLRequest {
        var request = URLRequest(url: buildURL(path: "/v1/bankid/poll/\(transactionId)"))
        request.httpMethod = "GET"
        request.addValue("ea749681-01fc-42dd-90ff-bf52dd4e9277", forHTTPHeaderField: "API-KEY")
        return request
    }

//    func graphqlRequest(_ sso: String, postData: Data, completion: @escaping (String?, GraphQLData?) -> Void) -> Void {
//        let semaphore = DispatchSemaphore (value: 0)
//        var request = URLRequest(url: URL(string: backendUrl+"/v1/graphql")!,timeoutInterval: Double.infinity)
//        request.addValue("ea749681-01fc-42dd-90ff-bf52dd4e9277", forHTTPHeaderField: "API-KEY")
//        request.addValue(sso, forHTTPHeaderField: "Authorization")
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        request.httpMethod = "POST"
//        request.httpBody = postData
//
//        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
//            if let self = self {
//                guard let httpResponse = response as? HTTPURLResponse,
//                      (200...299).contains(httpResponse.statusCode) else {
//                    print("Error with the response, unexpected status code: \(String(describing: response))")
//                    completion("\(String(describing: response))", nil)
//                    self.transactionId = "";
//                    self.pollResponse = nil;
//                    return
//                }
//
//                print(httpResponse.statusCode)
//                guard let data = data else {
//                    print(String(describing: error))
//                    return
//                }
//
//                print(String(data: data, encoding: .utf8)!)
//
//                let graphQLData = try? JSONDecoder().decode(GraphQLData.self, from: data)
//
//                self.userData = graphQLData;
//                semaphore.signal()
//                completion(nil, graphQLData)
//            }
//        }
//
//        task.resume()
//        semaphore.wait()
//    }
//
    func startPoll(transactionId: String, _ run: Int, completion: @escaping (Result<Bool, Error>) -> Void) {
        let request = pollRequest(transactionId: transactionId)

        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 1) {
            let task = URLSession.shared.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in
                if let self = self {
                    if let error = error {
                        print("Error with fetching: \(error)")
                        completion(.failure(error))
                        return
                    }

                    guard let httpResponse = response as? HTTPURLResponse,
                          (200 ... 299).contains(httpResponse.statusCode)
                    else {
                        self.transactionId = ""
                        self.pollResponse = nil
                        completion(.success(false))
                        return
                    }

                    guard let responseData = data else {
                        print("JSON String:nil")
                        return
                    }

                    if let r = try? JSONDecoder().decode(PollResponse.self, from: responseData) {
                        if r.status == "SUCCESS" {
                            self.pollResponse = r

                            do {
                                try self.tokenService.setValue(for: r.folksam_sso!)
                            } catch let keychainError {
                                completion(.failure(keychainError))
                            }

                            completion(.success(true))
                        } else {
                            self.startPoll(transactionId: transactionId, run + 1, completion: completion)
                        }
                    }
                }
            })
            task.resume()
        }
    }

    func openBankidApp() {
        DispatchQueue.main.async {
            let url = URL(string: "https://app.bankid.com/?redirect=folksam-app://")
            UIApplication.shared.open(url!, options: [.universalLinksOnly: true]) { success in
                if !success {
                    UIApplication.shared.open(URL(string: "https://apps.apple.com/se/app/bankid-s%C3%A4kerhetsapp/id433151512")!)
                }
            }
        }
    }

    // TODO: return a Result error
    public func startBankid(pnr: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        
        if mocked {
            completion(.success(true))
            return
        }
        
        pollResponse = nil
        let params = BankidRequest(ssn: pnr)
        var request = URLRequest(url: buildURL(path: "/v1/bankid"))
        request.httpMethod = "POST"

        let body = try? JSONEncoder().encode(params)
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("ea749681-01fc-42dd-90ff-bf52dd4e9277", forHTTPHeaderField: "API-KEY")

        // TODO: move to a networkmanager
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { [weak self] data, response, error -> Void in

            if let self = self {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        do {
                            let bankidResponse = try? JSONDecoder().decode(BankidResponse.self, from: data!)
                            let transactionId = bankidResponse!.transactionID.transactionID
                            self.startPoll(transactionId: transactionId, 1, completion: completion)
                            self.openBankidApp()
                        }
                    } else {
                        self.transactionId = ""
                        self.pollResponse = nil
                        if let error = error {
                            print(error)
                            completion(.failure(error))
                        }
                    }
                }
            } else {
                completion(.failure("self is not self"))
            }
        })

        task.resume()
    }
}

// MARK: - DataTypes

public extension FolksamAPI {
    struct BankidRequest: Codable {
        let ssn: String
    }

    struct PollResponse: Codable {
        let status: String
        let folksam_sso: String?
    }

    // MARK: - BankidResponse

    struct BankidResponse: Codable {
        let transactionID: TransactionID

        enum CodingKeys: String, CodingKey {
            case transactionID = "transactionId"
        }
    }

    // MARK: - TransactionID

    struct TransactionID: Codable {
        let status: Int
        let transactionID: String

        enum CodingKeys: String, CodingKey {
            case status
            case transactionID = "transactionId"
        }
    }
}
#endif
