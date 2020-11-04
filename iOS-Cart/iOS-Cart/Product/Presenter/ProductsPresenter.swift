//
//  ProductsPresenter.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation

protocol ProductsPresenterProtocol: class {
    var view: ProductViewProtocol? { get set }
    var interactor: ProductsInteractorInputProtocol? { get set }
    var router: ProductsRouterProtocol? { get set }
    
    func getAllProducts()
    func createProduct(modal: ProductRequestEntity)
    
}

class ProductsPresenter: ProductsPresenterProtocol {
    
    weak var view: ProductViewProtocol?
    var interactor: ProductsInteractorInputProtocol?
    var router: ProductsRouterProtocol?
    
    func getAllProducts() {
        view?.showLoading()
        interactor?.getAllProducts()
    }
    
    func createProduct(modal: ProductRequestEntity) {
        view?.showLoading()
        interactor?.createProduct(modal: modal)
    }
}

extension ProductsPresenter: ProductsInteractorOutputProtocol {

    func didRetriveProducts(modal: [ProductResponseEntity]) {
        view?.hideLoading()
        view?.reloadInterface(modal: modal)
    }
    
    func didCreateProduct() {
        view?.hideLoading()
        view?.refreshData()
    }
}
