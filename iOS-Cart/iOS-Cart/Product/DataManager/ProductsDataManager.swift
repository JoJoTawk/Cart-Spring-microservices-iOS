//
//  DataManager.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

typealias ProductsCompletion = (([ProductResponseEntity]) -> Void)
typealias SuccessCompletion = ((Bool) -> Void)

protocol ProductsDataManagerProtocol: class  {
    
    func getAllProducts(completion: @escaping ProductsCompletion)
    func createProduct(modal: ProductRequestEntity, completion: @escaping SuccessCompletion)
}

class ProductsDataManager: ProductsDataManagerProtocol {
    
    func getAllProducts(completion: @escaping ProductsCompletion) {
      
        let service = NetworkService(session: URLSession(configuration: .ephemeral),
                                     modifiers: ProductProvider.getProducts.build())
            
        service.apiCall { (result) in
                
            switch result {
            case .failure(let error):
                print(error)
                break
            case .success(let data):
                do {
                    print(String(data: data, encoding: .utf8)!)
                    let modal = try JSONDecoder().decode([ProductResponseEntity].self, from: data)
                    completion(modal)
                } catch(let error) {
                    print(error)
                }
            }
        }
    }
    
    func createProduct(modal: ProductRequestEntity, completion: @escaping SuccessCompletion) {
        let service = NetworkService(session: URLSession(configuration: .ephemeral),
                                     modifiers: ProductProvider.addProduct(
                                        params: modal.EncodeJSON()).build())
            
        service.apiCall { (result) in
                
            switch result {
            case .failure(let error):
                print(error)
                completion(false)
                break
            case .success( _):
                completion(true)
            }
        }
    }
}
