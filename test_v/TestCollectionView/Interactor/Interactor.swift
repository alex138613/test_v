//
//  Interactor.swift
//  TestCollectionView
//
//  Created by Alex on 22.11.2021.
//

import UIKit


@objc protocol InteractorProtocol {
    func interactorOutput()
}

class Interactor: NSObject, InteractorProtocol {

    weak var presenter: Presenter?
    var model: Model?

    // MARK: - InteractorProtocol
    func interactorOutput() {
        let set = createData()
        let array = set.names
        let arrayImages = set.images
        self.presenter?.viewInput(array: array, arrayImage: arrayImages)
    }


    private func createData() -> (names:[String], images:[UIImage]) {
        var array = [String]()
        var arrayImages = [UIImage]()

        for i in 0...10 {
            createModel(ind: i)

            if let model = model, let descrip = model.descrip, let image = model.imageName {
                array.append(descrip)
                arrayImages.append(image)
            }
        }

        return (names: array, images:arrayImages)
    }

    private func createModel(ind: Int) {
        model = Model()
        guard let named = model?.createImageName(),
              let image = UIImage(named: named) else {
            return
        }
        model?.imageName = image
        model?.descrip = "Image named:\(named) ind: \(ind)"
    }
}
