//
//  SceneDelegate.swift
//  Playgrounds
//
//  Created by Мария on 15.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // настройка тапбара (внизу). У меня 3 кнопки: карта, поиск, рейтинг лучших(??) и личная инфа
// первое, что будет показываться
//города

    func createCitiesNavigationController() -> UINavigationController {
        let citiesViewController = UINavigationController(rootViewController: CitieslViewController())
        citiesViewController.tabBarItem = UITabBarItem(title: "Города", image: UIImage(systemName: "house.circle.fill"), tag: 0)

        let appearanceCities = UINavigationBarAppearance()
        appearanceCities.configureWithDefaultBackground()
        citiesViewController.navigationBar.standardAppearance = appearanceCities
        citiesViewController.navigationBar.scrollEdgeAppearance = appearanceCities
        citiesViewController.navigationBar.prefersLargeTitles = true
        citiesViewController.navigationBar.backgroundColor = .white

        return citiesViewController

    }
    //карта
    func createMapNavigationController() -> UINavigationController {
        let mapViewController = UINavigationController(rootViewController: MapViewController())
        mapViewController.tabBarItem = UITabBarItem(title: "Карта", image: UIImage(systemName: "map"), tag: 0)

        let appearanceMap = UINavigationBarAppearance()
        appearanceMap.configureWithDefaultBackground()
        mapViewController.navigationBar.standardAppearance = appearanceMap
        mapViewController.navigationBar.scrollEdgeAppearance = appearanceMap
        mapViewController.navigationBar.prefersLargeTitles = true
        mapViewController.navigationBar.backgroundColor = .white

        return mapViewController

    }

    // поиск
    func createSearchViewController() -> UINavigationController {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 0)

        let appearanceSearch = UINavigationBarAppearance()
        appearanceSearch.configureWithDefaultBackground()
        searchViewController.navigationBar.standardAppearance = appearanceSearch
        searchViewController.navigationBar.scrollEdgeAppearance = appearanceSearch

        return searchViewController
        
    }

    // личная инфа

    func createPersonalViewController() -> UINavigationController {
        let personalViewController = UINavigationController(rootViewController: PersonalViewController())
        personalViewController.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 0)

        let appearancePersone = UINavigationBarAppearance()
        appearancePersone.configureWithDefaultBackground()
        personalViewController.navigationBar.standardAppearance = appearancePersone
        personalViewController.navigationBar.scrollEdgeAppearance = appearancePersone

        return personalViewController

    }

    func createTabBarController() -> UITabBarController {
        let tabBarController = UITabBarController()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .white
        tabBarController.tabBar.standardAppearance = tabBarAppearance
        tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance

        //цвет выбранной кнопки вместо синего по умолчанию
//        tabBarController.tabBar.tintColor = UIColor(red: 161/255.0, green: 22/255.0, blue: 204/255.0, alpha: 1.0)

        tabBarController.viewControllers = [createCitiesNavigationController(), createMapNavigationController(), createSearchViewController(), createPersonalViewController()]

        return tabBarController
    }


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let winScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: winScene)
        window.rootViewController = createTabBarController()
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

