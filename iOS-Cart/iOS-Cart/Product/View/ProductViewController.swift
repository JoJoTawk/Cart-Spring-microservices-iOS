//
//  ProductView.swift
//  iOS-Cart
//
//  Created by Jhonny on 10/28/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

protocol ProductViewProtocol: class {
    
    var presenter: ProductsPresenterProtocol? { get set }

    func showLoading()
    func hideLoading()
    func reloadInterface(modal: [ProductResponseEntity])
    func refreshData()
}

class ProductViewController: UIViewController {
    
    var presenter: ProductsPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        createProduct()
    }

    func createProduct() {
        
        let modal = ProductRequestEntity(productCode: "AW5",
                                         productTitle: "Watch number 5",
                                         imageUrl: "https://staticimg.titan.co.in/Titan/Catalog/90014KC01J_1.jpg?pView=pdp",
                                         price: 50)
        
        presenter?.createProduct(modal: modal)
        
    }
    
    func getAllProducts() {
        presenter?.getAllProducts()
    }
}

extension ProductViewController: ProductViewProtocol {
   
    func refreshData() {
        getAllProducts()
    }
    
    func showLoading() {
        DispatchQueue.main.async {
            LoadingIndicator.shared.showLoading()
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            LoadingIndicator.shared.hideLoading()
        }
    }
    
    func reloadInterface(modal: [ProductResponseEntity]) {
        print(modal)
    }
}
