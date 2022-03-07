//
//  APIEnvironment.swift
//  Networking
//
//  Created by Johan Torell on 2021-02-02.
//

import Foundation

let kDevApiKey: String = ""
let kTestApiKey: String = "ea749681-01fc-42dd-90ff-bf52dd4e9277"
let kProdApiKey: String = ""

private let dev = (
    // baseURL: URL(string: "http://172.29.140.22:4000")!,
    // baseURL: URL(string: "http://172.29.140.21:4000")!,
    baseURL: URL(string: "http://127.0.0.1:4000")!,
    apiKey: kDevApiKey,
    graphql: "/v1/graphql"
)

private let test = (
    baseURL: URL(string: "https://ffl-customer-api-devtest.apps.intern.folksam.se")!,
    apiKey: kTestApiKey,
    graphql: "/v1/graphql"
)

private let prod = (
    baseURL: URL(string: "https://ffl-customer-api-devtest.apps.intern.folksam.se")!,
    apiKey: kProdApiKey,
    graphql: "/v1/graphql"
)

private let mock = (
    baseURL: URL(string: "https://mocked")!,
    apiKey: "mocked",
    graphql: "/v1/graphql"
)

public enum APIEnvironment {
    case mocked
    case development
    case production
    case testing

    public var baseURL: URL {
        switch self {
        case .mocked: return mock.baseURL
        case .development: return dev.baseURL
        case .testing: return test.baseURL
        case .production: return prod.baseURL
        }
    }

    public var apiKey: String {
        switch self {
        case .mocked: return mock.apiKey
        case .development: return dev.apiKey
        case .testing: return test.apiKey
        case .production: return prod.apiKey
        }
    }

    public var graphql: String {
        switch self {
        case .mocked: return mock.graphql
        case .development: return dev.graphql
        case .testing: return test.graphql
        case .production: return prod.graphql
        }
    }
}
