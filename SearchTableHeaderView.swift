//
//  SearchTableHeaderView.swift
//  Playgrounds
//
//  Created by Мария on 30.05.2023.
//

import Foundation
import UIKit

class SearchTableHeaderView: UIView, UITextFieldDelegate {


    private let backgroundView: UIView = {
        let searchView = UIView()
//        searchView.frame = CGRect(x: 0, y: 0, width: 1700, height: 800)
        searchView.backgroundColor = UIColor(red: 0.67, green: 0.79, blue: 0.74, alpha: 1.00)
        searchView.translatesAutoresizingMaskIntoConstraints = false
        return searchView
    }()


    lazy var searchTextField: UITextField = {
        let searchTf = UITextField()
        searchTf.backgroundColor = UIColor(red: 0.44, green: 0.60, blue: 0.55, alpha: 0.70)
//        searchTf.layer.borderColor = UIColor(red: 0.90, green: 0.47, blue: 0.05, alpha: 1.00)
        searchTf.layer.borderColor = UIColor(red: 0.44, green: 0.60, blue: 0.55, alpha: 0.20).cgColor
        searchTf.layer.borderWidth = 0.5
        searchTf.layer.cornerRadius = 7
        searchTf.font = .systemFont(ofSize: 14)
        searchTf.textColor = .black
        searchTf.autocapitalizationType = .none
        searchTf.placeholder = "    Поиск"
//        citiesViewController.tabBarItem = UITabBarItem(title: "Города", image: UIImage(systemName: "house.circle.fill"), tag: 0)
        searchTf.textAlignment = .left
        searchTf.delegate = self
        searchTf.tag = 1
        searchTf.translatesAutoresizingMaskIntoConstraints = false
        return searchTf

    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        addElements()
        addConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // добавление элементов на View, scrollView, contentView
    private func addElements() {
        
        addSubview(backgroundView)
        addSubview(searchTextField)

    }

    private func addConstraints() {

        NSLayoutConstraint.activate([

            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            backgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            backgroundView.heightAnchor.constraint(equalToConstant: 50),

            searchTextField.topAnchor.constraint(equalTo: backgroundView.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor),
            searchTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            searchTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
        ])
    }


}
