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
        text.font = .systemFont(ofSize: 17, weight: .black)
        text.textColor = .black
//        text.text = "Санкт-Петербург"
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private let cityImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()

    //количество площадок
    private let playgroundsAmountLabel: UILabel = {
        let playgroundsLabel = UILabel()
        playgroundsLabel.font = .systemFont(ofSize: 16)
        playgroundsLabel.textColor = .systemGray
        playgroundsLabel.translatesAutoresizingMaskIntoConstraints = false
        return playgroundsLabel
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)

        setUpMyCell()
        addConstraints()
        selectionStyle = .none

    }

    func setUpMyCell() {

        contentView.addSubview(cityLabel)
        contentView.addSubview(cityImageView)
        contentView.addSubview(playgroundsAmountLabel)

    }

    func addConstraints() {
        NSLayoutConstraint.activate([

            cityImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cityImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            cityImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cityImageView.heightAnchor.constraint(equalToConstant: 50),
            cityImageView.widthAnchor.constraint(equalTo: cityImageView.heightAnchor),

            cityLabel.topAnchor.constraint(equalTo:  cityImageView.topAnchor),
            cityLabel.leadingAnchor.constraint(equalTo: cityImageView.trailingAnchor, constant: 15),
            cityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
//            cityLabel.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),

//            playgroundsAmountLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor),
            playgroundsAmountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            playgroundsAmountLabel.leadingAnchor.constraint(equalTo: cityImageView.trailingAnchor, constant: 15),
            playgroundsAmountLabel.bottomAnchor.constraint(equalTo: cityImageView.bottomAnchor)
        ])
    }



    func configure(city: City) {
        self.cityID = city.cityID

        cityLabel.text = city.textName
        cityImageView.image = UIImage(named: city.image)
        playgroundsAmountLabel.text = "Детских площадок: \(city.playgrounds)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
//   City(
//cityID: 2,
//image: "Zadonsk",
//textName: "Задонск",
//playgrounds: 1
