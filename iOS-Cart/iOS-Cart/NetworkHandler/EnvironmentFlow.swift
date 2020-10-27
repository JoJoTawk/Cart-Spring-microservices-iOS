//
//  EnvironmentFlow.swift
//  iOS-Cart
//
//  Created by Jhonny on 10/28/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

/// Protocol to which environments must conform.
protocol EnvironmentProtocol {
    /// The default HTTP request headers for the environment.
    var headers: ReaquestHeaders? { get }

    /// The base URL of the environment.
    var baseURL: String { get }
}

/// Environments enum.
enum APIEnvironment: EnvironmentProtocol {
    /// The development environment.
    case development
    /// The production environment.
    case production

    /// The default HTTP request headers for the given environment.
    var headers: ReaquestHeaders? {
        switch self {
        case .development:
            return [
                "Content-Type" : "application/json",
                "Authorization" : "Bearer yourBearerToken"
            ]
        case .production:
            return [:]
        }
    }

    /// The base URL of the given environment.
    var baseURL: String {
        switch self {
        case .development:
            return "http://api.localhost:3000/v1/"
        case .production:
            return "https://api.yourapp.com/v1/"
        }
    }
}
