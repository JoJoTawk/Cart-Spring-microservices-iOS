//
//  Extensiin.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

extension Encodable {
    func EncodeJSON() -> String {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(self)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            guard let jsonString = json else {
                return ""
            }
            return jsonString
        } catch {}
        return ""
    }
}
