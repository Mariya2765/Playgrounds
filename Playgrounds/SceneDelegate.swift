//
//  SceneDelegate.swift
//  Playgrounds
//
//  Created by Мария on 15.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // настройка тапбара (внизу). У меня 3 кнопки: карта, поиск, рейтин лучших(??) и личная инфа
// первое, что будет показываться
    func createMapNavigationController() -> UINavigationController {
        let mapNavigationController = UINavigationController(rootViewController: MapNavigationController())
        mapNavigationController.tabBarItem = UITabBarItem(title: "Map", image: UIImage(systemName: "map"), tag: 0)

        let appearanceMap = UINavigationBarAppearance()
        appearanceMap.configureWithDefaultBackground()
        mapNavigationController.navigationBar.standardAppearance = appearanceMap
        mapNavigationController.navigationBar.scrollEdgeAppearance = appearanceMap
        mapNavigationController.navigationBar.prefersLargeTitles = true
        mapNavigationController.navigationBar.backgroundColor = .white

        return mapNavigationController

    }

    func createSearchViewController() -> UINavigationController {
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        searchViewController.tabBarItem = UITabBarItem(title: .none, image: UIImage(systemName: "magnifyingglass"), tag: 0)

        let appearanceSearch = UINavigationBarAppearance()
        appearanceSearch.configureWithDefaultBackground()
        searchViewController.navigationBar.standardAppearance = appearanceSearch
        searchViewController.navigationBar.scrollEdgeAppearance = appearanceSearch

        return searchViewController
        
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

        tabBarController.viewControllers = [createMapNavigationController(), createSearchViewController()]

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

