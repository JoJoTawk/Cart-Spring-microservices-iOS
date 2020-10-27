//
//  ProductEndPoints.swift
//  iOS-Cart
//
//  Created by Jhonny on 10/28/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

/// Books endpoint
enum productsEndpoint {
    /// Lists all the Products.
    case listProducts
    /// Fetches a product with a given identifier.
    case getProduct(identifier: String)
    /// Creates a Product with the given parameters.
    case createProduct(parameters: [String: Any?])
}

extension productsEndpoint: RequestProtocol {
    var path: String {
        switch self {
        case .listProducts:
            return "/products"
        case .getProduct(let identifier):
            return "/products/\(identifier)"
        case .createProduct(_):
            return "/books"
        }
    }

    var method: RequestMethod {
        switch self {
        case .listProducts:
            return .get
        case .getProduct(_):
            return .get
        case .createProduct(_):
            return .post
        }
    }

    var headers: ReaquestHeaders? {
        return nil
    }

    var parameters: RequestParameters? {
        switch self {
        case .listProducts:
            return nil
        case .getProduct(_):
            return nil
        case .createProduct(let parameters):
            return parameters
        }
    }

    var requestType: RequestType {
        return .data
    }

    var responseType: ResponseType {
        return .json
    }

    var progressHandler: ProgressHandler? {
        get { nil }
        set { }
    }
}

