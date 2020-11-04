//
//  ProductsRouter.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

protocol ProductsRouterProtocol: class {

    static func createProductModule() -> UIViewController
}

class ProductsRouter: ProductsRouterProtocol {
    
    static func createProductModule()  -> UIViewController {
        let instance: ProductViewController = ProductViewController()
        var presenter: ProductsPresenterProtocol & ProductsInteractorOutputProtocol = ProductsPresenter()
        var interactor: ProductsInteractorInputProtocol = ProductsInteractor()
        let dataManager: ProductsDataManagerProtocol = ProductsDataManager()
        let router: ProductsRouterProtocol = ProductsRouter()
        
        instance.presenter = presenter
        presenter.view = instance
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenterOutput = presenter
        interactor.dataManager = dataManager
        
        return instance
    }
}
