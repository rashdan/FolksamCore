//
//  NetworkingService.swift
//  FolksamAPI
//
//  Created by Johan Torell on 2021-02-02.
//

import Foundation

public class NetworkService {
    public init() {}
    private let session: NetworkSession = {
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        return NetworkSession(urlSession: URLSession(configuration: configuration))
    }()

    public func request() {}
}

private class NetworkSession {
    typealias ResultHandler<T: Decodable> = (NetworkResult<T>) -> Void

    private let urlSession: URLSession
    private let dateFormatter = DateFormatter()

    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    }

    func performRequest<T: Decodable>(request: URLRequest, completion: @escaping ResultHandler<T>) {
        let task = urlSession.dataTask(with: request) { [weak self] data, response, error in

            do {
                guard var data = data, let response = response as? HTTPURLResponse else {
                    throw error.map { NetworkError.general($0) } ?? NetworkError.unknown
                }

                guard 200 ... 299 ~= response.statusCode else {
                    throw NetworkError.httpErrorCode(response.statusCode)
                }

                if data.isEmpty, let emptyJSON = "{}".data(using: .utf8) {
                    // If no data, replce with empty JSON to
                    // allow for decoding of APINoValue.
                    data = emptyJSON
                }

                let jsonDecoder = JSONDecoder()
                jsonDecoder.dateDecodingStrategy = .custom {
                    let container = try $0.singleValueContainer()
                    let dateString = try container.decode(String.self)
                    if let date = self?.dateFormatter.date(from: dateString) {
                        return date
                    } else {
                        throw DecodingError.typeMismatch(Date.self, DecodingError.Context(codingPath: $0.codingPath, debugDescription: "Not a recognized date format."))
                    }
                }

                let value = try jsonDecoder.decode(T.self, from: data)

                completion(.success(value))

            } catch let error as NetworkError {
                completion(.failure(error))
            } catch let error as DecodingError {
                completion(.failure(NetworkError.decodingError(error)))
            } catch {
                completion(.failure(NetworkError.general(error)))
            }
        }

        task.resume()
    }
}

public enum NetworkResult<Value> {
    case success(Value)
    case failure(NetworkError)
}

public enum NetworkError: LocalizedError {
    case unknown
    case general(Error)
    case invalidURL(String)
    case httpErrorCode(Int)
    case decodingError(DecodingError)
    case mockedJSONDecodingError(String)

    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "Unknown API error."
        case let .general(error):
            return "Network error: \(error.localizedDescription)"
        case let .invalidURL(urlString):
            return "Invalid URL: \(urlString)"
        case let .httpErrorCode(errorCode):
            return "HTTP Error Code: \(errorCode)"
        case let .decodingError(error):
            return "Decoding error: \(error.localizedDescription)"
        case let .mockedJSONDecodingError(string):
            return "Mocked JSON decoding error: \(string)"
        }
    }
}
