//
//  Router.swift
//  TestCollectionView
//
//  Created by Alex on 22.11.2021.
//

import UIKit


@objc protocol RouterProtocol {
    func presentVC()
}

class Router: NSObject, RouterProtocol {

    var view: ViewController?
    var window: UIWindow?

    func presentVC() {
        self.window?.rootViewController = view
        self.window?.makeKeyAndVisible()
    }
}
