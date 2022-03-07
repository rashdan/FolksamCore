//
//  ApolloClient.swift
//  Apollo
//
//  Created by Johan Torell on 2021-02-02.
//

import Apollo
import Foundation

enum ApolloService {
    static func createClient(withEnvironment env: APIEnvironment, tokenService: TokenService) -> ApolloClient {
        
        // The cache is necessary to set up the store, which we're going to hand to the provider
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
        // create mocked if mocked
        if env == .mocked {
            let server = MockGraphQLServer()
            let networkTransport = MockNetworkTransport(server: server, store: store)
            
            return ApolloClient(networkTransport: networkTransport, store: store)
        }
        
        let urlSessionClient = URLSessionClient()
        let provider = NetworkInterceptorProvider(store: store, client: urlSessionClient, env: env, tokenService: tokenService)
        let url = env.baseURL.appendingPathComponent(env.graphql)

        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)

        // Remember to give the store you already created to the client so it
        // doesn't create one on its own
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store)
    }
}

private struct NetworkInterceptorProvider: InterceptorProvider {
    // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
    // will be handed to different interceptors.
    private let store: ApolloStore
    private let client: URLSessionClient
    private let env: APIEnvironment
    private let tokenService: TokenService

    init(store: ApolloStore,
         client: URLSessionClient, env: APIEnvironment, tokenService: TokenService)
    {
        self.env = env
        self.store = store
        self.client = client
        self.tokenService = tokenService
    }

    func interceptors<Operation: GraphQLOperation>(for _: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: store),
            UserManagementInterceptor(env: env, tokenService: tokenService),
            RequestLoggingInterceptor(),
            NetworkFetchInterceptor(client: client),
            ResponseLoggingInterceptor(),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(cacheKeyForObject: store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: store),
        ]
    }
}

private class UserManagementInterceptor: ApolloInterceptor {
    private let env: APIEnvironment
    private let tokenService: TokenService

    enum UserError: Error {
        case noUserLoggedIn
    }

    init(env: APIEnvironment, tokenService: TokenService) {
        self.env = env
        self.tokenService = tokenService
    }

    /// Helper function to add the token then move on to the next step
    private func addTokenAndProceed<Operation: GraphQLOperation>(
        _ token: String,
        to request: HTTPRequest<Operation>,
        chain: RequestChain,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        request.addHeader(name: "Authorization", value: "\(token)")
        request.addHeader(name: "API-KEY", value: "\(env.apiKey)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }

    func interceptAsync<Operation: GraphQLOperation>(chain: RequestChain, request: HTTPRequest<Operation>, response: HTTPResponse<Operation>?, completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        guard let token = tokenService.getValue() else {
            // In this instance, no user is logged in, so we want to call
            // the error handler, then return to prevent further work
            chain.handleErrorAsync(UserError.noUserLoggedIn,
                                   request: request,
                                   response: response,
                                   completion: completion)
            return
        }

        // TODO: create a token class and save instead of just a string, this way we chan create and check props on the token
        //
        // If we've gotten here, there is a token!
//        if token.isExpired {
//            // Call an async method to renew the token
//            UserManager.shared.renewToken { [weak self] tokenRenewResult in
//                guard let self = self else {
//                    return
//                }
//
//                switch tokenRenewResult {
//                case .failure(let error):
//                    // Pass the token renewal error up the chain, and do
//                    // not proceed further. Note that you could also wrap this in a
//                    // `UserError` if you want.
//                    chain.handleErrorAsync(error,
//                                           request: request,
//                                           response: response,
//                                           completion: completion)
//                case .success(let token):
//                    // Renewing worked! Add the token and move on
//                    self.addTokenAndProceed(token,
//                                            to: request,
//                                            chain: chain,
//                                            response: response,
//                                            completion: completion)
//                }
//            }
//        } else {
        // We don't need to wait for renewal, add token and move on
        addTokenAndProceed(token, to: request, chain: chain, response: response, completion: completion)
//        }
    }
}

private class RequestLoggingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        print("Outgoing request: \(request)")
        chain.proceedAsync(request: request,
                           response: response,
                           completion: completion)
    }
}

private class ResponseLoggingInterceptor: ApolloInterceptor {
    enum ResponseLoggingError: Error {
        case notYetReceived
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        defer {
            // Even if we can't log, we still want to keep going.
            chain.proceedAsync(request: request,
                               response: response,
                               completion: completion)
        }

        guard let receivedResponse = response else {
            chain.handleErrorAsync(ResponseLoggingError.notYetReceived,
                                   request: request,
                                   response: response,
                                   completion: completion)
            return
        }

        print("HTTP Response: \(receivedResponse.httpResponse)")

        if let stringData = String(bytes: receivedResponse.rawData, encoding: .utf8) {
            print("Data: \(stringData)")
        } else {
            print("Could not convert data to string!")
        }
    }
}
