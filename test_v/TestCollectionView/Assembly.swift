//
//  Assembly.swift
//  TestCollectionView
//
//  Created by Alex on 22.11.2021.
//

import UIKit


class Assembly {

    static func creageModul() -> Router {
        let view = ViewController()
        let presenter = Presenter()
        let interactor = Interactor()
        let router = Router()

        view.presenter = presenter

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router

        interactor.presenter = presenter

        router.view = view

        return router
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?,
                     window: UIWindow) -> Bool {
        let router = Assembly.creageModul()
        router.window = window
        router.presentVC()

        return true
    }
}
