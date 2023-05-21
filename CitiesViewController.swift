//
//  CitiesViewController.swift
//  Playgrounds
//
//  Created by Мария on 21.05.2023.
//

import UIKit
class CitieslViewController: UIViewController {

    private enum Constants {
        static let reuseIdentifire = "cellID"
    }

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire )
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Информация"
        view.addSubview(tableView)
        self.tableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        addConstraintsOfTableView()

    }

    private func addConstraintsOfTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

// UIDataSource
extension CitieslViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath) as! CitiesTableViewCell
//        var content = cell.defaultContentConfiguration()
//        content.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: "
//        cell.contentConfiguration = content

        return cell
    }




}
