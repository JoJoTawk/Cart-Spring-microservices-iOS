//
//  FirstRunViewController.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import UIKit

class FirstRunViewController: UIViewController {

    @IBOutlet weak var adminBtn: UIButton! {
        didSet {
            adminBtn.layer.cornerRadius = 10
            adminBtn.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var userBtn: UIButton! {
        didSet {
            userBtn.layer.cornerRadius = 10
            userBtn.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func adminAction(_ sender: Any) {
        let instance = ProductsRouter.createProductModule()
        instance.isModalInPresentation = true
        instance.modalPresentationStyle = .fullScreen
        present(instance, animated: true)
    }
    
    @IBAction func userAction(_ sender: Any) {
    }
    
}
