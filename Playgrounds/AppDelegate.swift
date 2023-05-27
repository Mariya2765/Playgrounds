//
//  AppDelegate.swift
//  Playgrounds
//
//  Created by Мария on 15.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }

//    func applicationDidFinishLaunching(_ application: UIApplication) {
//
//        let myColor = UIColor(red: 0.98, green: 0.79, blue: 0.60, alpha: 0.50)
//        let barAppearance = UINavigationBarAppearance()
//        barAppearance.backgroundColor = myColor
//
//        let navigationBar = UINavigationBar.appearance()
//        navigationBar.standardAppearance = barAppearance
//        navigationBar.scrollEdgeAppearance = barAppearance
//        let navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = UIColor(red: 0.98, green: 0.79, blue: 0.60, alpha: 0.50)
//        navigationBarAppearace.barTintColor = UIColor(red: 0.98, green: 0.79, blue: 0.60, alpha: 0.50)



//    }


}

