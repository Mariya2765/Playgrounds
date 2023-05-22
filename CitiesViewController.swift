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

    private var citiesArray = CitiesProvider.getCity()

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
        navigationItem.title = "Города"
        view.addSubview(tableView)
        self.tableView.register(CitiesTableViewCell.self, forCellReuseIdentifier: Constants.reuseIdentifire)
        addConstraintsOfTableView()


        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))

        // цвет кнопки добавления
//        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)

    }

    //кнопка добавления города
    @objc private func addHabit() {

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
        return citiesArray.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.reuseIdentifire, for: indexPath) as! CitiesTableViewCell
        let city = citiesArray[indexPath.row]
        cell.configure(city: city)
        
//        var content = cell.defaultContentConfiguration()
//        content.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму: "
//        cell.contentConfiguration = content

        return cell
    }




}
