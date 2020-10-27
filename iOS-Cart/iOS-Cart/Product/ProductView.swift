//
//  ProductView.swift
//  iOS-Cart
//
//  Created by Jhonny on 10/28/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit
class ProductView: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let requestDispatcher = APIRequestDispatcher(environment: APIEnvironment.development, networkSession: APINetworkSession())
        let params: [String : Any] = [
           "name": "Gone with the wind",
           "author": "Margaret Mitchell"
        ]

        let bookCreationRequest = BooksEndpoint.create(parameters: params)

        let bookOperation = APIOperation(bookCreationRequest)
        bookOperation?.execute(in: requestDispatcher) { result in
          // Handle result
        }
        
    }
}
