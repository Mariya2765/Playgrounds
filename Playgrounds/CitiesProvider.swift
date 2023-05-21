//
//  Post.swift
//  Navigation
//
//  Created by Мария on 27.11.2022.
//

import Foundation

struct City {
    let cityID: Int
    let image: String
    var textName: String
    var playgrounds: Int

}

public class CitiesProvider {
    static func getCity() -> [City] {
        [
            City(
                cityID: 0,
                image: "St.Pitersburg",
                textName: "Санкт-Петербург",
                playgrounds: 20
            ),

            City(
                cityID: 1,
                image: "Dubrovo",
                textName: "Дуброво",
                playgrounds: 5
            ),

            City(
                cityID: 2,
                image: "Zadonsk",
                textName: "Задонск",
                playgrounds: 1
            )
        ]
    }
}

