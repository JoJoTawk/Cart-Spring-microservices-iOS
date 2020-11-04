//
//  ProductRequestBuilder.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

enum ProductProvider {
    case addProduct(params: String)
    case getProducts
}

extension ProductProvider: Request {
   
    var method: HTTPMethod {
        switch self {
        case .addProduct(_):
            return .post
        case .getProducts:
            return .get
        }
    }
    
    var body: String? {
        switch self {
        case .addProduct(let params):
            return params
        case .getProducts:
            return nil
        }
    }
    
    var path: String {
        return host + API.addProduct
    }
    
    var host: String {
        return API.host
    }
}
