//
//  ProductEntity.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

struct ProductRequestEntity: Encodable {
    
    var productCode: String?
    var productTitle: String?
    var imageUrl: String?
    var price: Int?
    
    init(productCode: String,
         productTitle: String,
         imageUrl: String,
         price: Int) {

        self.productCode = productCode
        self.productTitle = productTitle
        self.imageUrl = imageUrl
        self.price = price
    }
}

struct ProductResponseEntity: Codable {

    var id: Int
    var productCode: String
    var productTitle: String
    var imageUrl: String
    var price: Int?
}
