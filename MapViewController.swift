//
//  1234.swift
//  Playgrounds
//
//  Created by Мария on 15.05.2023.
//

import UIKit
import MapKit

class MapViewController: UIViewController {


    let mapView: MKMapView = {
        let map = MKMapView()
        // вид интерфейса темный
        map.overrideUserInterfaceStyle = .dark
        map.translatesAutoresizingMaskIntoConstraints = false

        return map
    }()
//    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        setMapConstreints()
    }

    func setMapConstreints() {
        NSLayoutConstraint.activate([

            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
    }

}
