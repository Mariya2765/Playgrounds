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
    private let headerView = SearchTableHeaderView()

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


        let navBar = self.navigationController!.navigationBar
        let standardAppearance = UINavigationBarAppearance()
        standardAppearance.configureWithOpaqueBackground()
       
        standardAppearance.backgroundColor = UIColor(red: 0.67, green: 0.79, blue: 0.74, alpha: 1.50)
        navBar.standardAppearance = standardAppearance
        navBar.scrollEdgeAppearance = standardAppearance



//        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)

//        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 0.67, green: 0.79, blue: 0.74, alpha: 1.00)

        navigationItem.titleView?.isHidden = false
        addConstraintsOfTableView()


        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addHabit))

        // цвет кнопки добавления
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
       

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


    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
        return citiesArray.count
    }
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
