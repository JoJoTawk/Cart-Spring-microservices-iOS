//
//  LoadingIndicator.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

class LoadingIndicator: NSObject {
    static let shared = LoadingIndicator()

    private override init() {
        super.init()
    }

    // MARK: - Loading Indicator Methods
    func showLoading() {
        let parentView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: UIScreen.main.bounds.size.height))
        parentView.backgroundColor = AppColor.mainAppColor
        let actInd: UIActivityIndicatorView = UIActivityIndicatorView()
        actInd.frame = CGRect(x: 0.0, y: 0.0, width: 25.0, height: 25.0)
        actInd.style = UIActivityIndicatorView.Style.large
        let y = parentView.frame.size.height / 2 - 25.0 / 2
        actInd.center = CGPoint(x: parentView.frame.size.width / 2,
                                y: y)
        actInd.color = AppColor.adminColor
        actInd.startAnimating()
        parentView.addSubview(actInd)
        parentView.tag = Globaltags.Loading_tag
        AppInstances.sceneDelgate.window?.addSubview(parentView)
    }

    func hideLoading() {
        let parentView = AppInstances.sceneDelgate.window?.viewWithTag(Globaltags.Loading_tag)
        parentView?.removeFromSuperview()
    }
}
