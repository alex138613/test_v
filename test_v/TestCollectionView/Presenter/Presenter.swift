//
//  Presenter.swift
//  TestCollectionView
//
//  Created by Alex on 22.11.2021.
//

import UIKit


@objc protocol PresenterProtocol {
    func viewOutput()
    func viewInput(array: [String], arrayImage: [UIImage])
}

class Presenter: NSObject, PresenterProtocol {

    weak var view: ViewController?
    var interactor: Interactor?
    var router: Router?

    // MARK: - PresenterProtocol
    func viewOutput() {
        self.interactor?.interactorOutput()
    }

    func viewInput(array: [String], arrayImage: [UIImage]) {
        self.view?.getItems(array: array, arrayImage: arrayImage)
    }
}
