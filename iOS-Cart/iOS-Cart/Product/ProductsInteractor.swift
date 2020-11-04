//
//  ProductInteractor.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

protocol ProductsInteractorOutputProtocol {
    func didRetriveProducts(modal: [ProductResponseEntity])
    func didCreateProduct()
}

protocol ProductsInteractorInputProtocol {
    var presenterOutput: ProductsInteractorOutputProtocol? { get set }
    var dataManager: ProductsDataManagerProtocol? { get set }
    
    func getAllProducts()
    func createProduct(modal: ProductRequestEntity)
}

class ProductsInteractor: ProductsInteractorInputProtocol {

    var dataManager: ProductsDataManagerProtocol?
    var presenterOutput: ProductsInteractorOutputProtocol?
    
    func getAllProducts() {
        dataManager?.getAllProducts(completion: { [weak self] (modal) in
            self?.presenterOutput?.didRetriveProducts(modal: modal)
        })
    }
    
    func createProduct(modal: ProductRequestEntity) {
        dataManager?.createProduct(modal: modal, completion: { [weak self] (success) in
            self?.presenterOutput?.didCreateProduct()
        })
    }
}
