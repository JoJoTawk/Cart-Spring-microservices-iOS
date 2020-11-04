//
//  KeysAndTags.swift
//  iOS-Cart
//
//  Created by Jhonny on 11/4/20.
//  Copyright © 2020 Baloombaz. All rights reserved.
//

import Foundation
import UIKit

struct Globaltags {
    static let Loading_tag = 3434
}

struct AppInstances {
    static let sceneDelgate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate ?? SceneDelegate()
}
