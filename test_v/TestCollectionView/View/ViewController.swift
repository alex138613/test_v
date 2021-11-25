//
//  ViewController.swift
//  TestCollectionView
//
//  Created by Alex on 22.11.2021.
//

import UIKit


@objc protocol ViewControllerProtocol {
    func getItems(array: [String], arrayImage: [UIImage])
}

class ViewController: UIViewController, ViewControllerProtocol {

    var presenter: Presenter?

    private let cellId = "cellId"
    private var array: [String] = []
    private var arrayImage: [UIImage] = []

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemIndigo

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)

        presenter?.viewOutput()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        setup()
    }

    private func setup() {
        let safeArea = view.layoutMarginsGuide

        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor) .isActive = true

        view.layoutIfNeeded()
    }

    // MARK: - ViewControllerProtocol
    func getItems(array: [String], arrayImage: [UIImage]) {
        self.array = array
        self.arrayImage = arrayImage

        tableView.reloadData()
    }
}


// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)

        let ind = indexPath.row

        cell.textLabel?.text = array[ind]

        cell.imageView?.image = arrayImage[ind]
        cell.imageView?.backgroundColor = .systemGreen

        return cell
    }

}


// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85.0
    }
}
