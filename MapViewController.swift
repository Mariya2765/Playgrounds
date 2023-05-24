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
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(mapView)
        setMapConstreints()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAnable()
    }

    func setMapConstreints() {
        NSLayoutConstraint.activate([

            mapView.topAnchor.constraint(equalTo: self.view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
    }

    //проверка включена ли служба отслеживания геопозиции, если выключена - выскакивает сообщение
    func checkLocationAnable() {
        if CLLocationManager.locationServicesEnabled() {
            setupManager()
            checkAutorization()
        } else {

            shoeAlertLocation(title: "У вас выключена служба геолокации", message: "Хотите включить?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))

        }
    }


    func setupManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }

// разрешение на использование местоположения (координат)

    func checkAutorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            shoeAlertLocation(title: "Запрещено использование геопозиции", message: "Хотите это изменить?", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()

        }
    }

    func shoeAlertLocation(title: String, message: String?, url: URL?) {
//        URL(string: "App-Prefs:root=LOCATION_SERVICES")
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Настройки", style: .default) { (alert) in
            if let url = url {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alert.addAction(settingsAction)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
        }
    }


extension MapViewController: CLLocationManagerDelegate {

   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAutorization()
    }
}
