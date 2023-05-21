//
//  CitiesTableViewCell.swift
//  Playgrounds
//
//  Created by Мария on 21.05.2023.
//

import Foundation
import UIKit

class CitiesTableViewCell: UITableViewCell {

//    private let titleLabel: UILabel = {
//        let title = UILabel()
//        title.font = .systemFont(ofSize: 20, weight: .semibold)
//        title.textColor = .black
//        title.text = "Привычка за 21 день"
//        title.translatesAutoresizingMaskIntoConstraints = false
//        return title
//    }()
    private var cityID: Int?
    
    private let cityLabel: UILabel = {
        let text = UILabel()
        text.font = .systemFont(ofSize: 17, weight: .regular)
        text.textColor = .black
//        text.text = "Санкт-Петербург"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false

        return text
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        setUpMyCell()
        addConstraints()
        selectionStyle = .none

    }

    func setUpMyCell() {

        contentView.addSubview(cityLabel)

    }

    func addConstraints() {
        NSLayoutConstraint.activate([

            cityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cityLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 50)

        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(city: City) {
        self.cityID = city.cityID

        cityLabel.text = city.textName
    }
}
