//
//  Model.swift
//  TestCollectionView
//
//  Created by Alex on 22.11.2021.
//

import UIKit

@objc protocol ModelProtocol {
    func createImageName() -> String
}

class Model: NSObject, ModelProtocol {
    var imageName: UIImage?
    var descrip: String?

    private let list = ["file","download", "profile"]

    // MARK: - ModelProtocol
    func createImageName() -> String {
        let range = 0...list.count-1
        let index = Int.random(in: range)
        let named = list[index]
        return named
    }
}
