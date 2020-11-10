//
//  AppDelegate.swift
//  exUITabbar
//
//  Created by hjkHack on 2020/11/10.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = createTabbarVC()
        return true
    }

    func createFirstNC()->UINavigationController {
        let vc = FirstVC()
        vc.tabBarItem = .init(title: "archivebox vc", image: UIImage(systemName: "archivebox"), tag: 0)
        let nc = UINavigationController(rootViewController: vc)
        return nc
    }

    func createSecondNC()->UINavigationController {
        let vc = SecondVC()
        vc.tabBarItem = .init(title: "calendar vc", image: UIImage(systemName: "calendar"), tag: 1)
        let nc = UINavigationController(rootViewController: vc)
        return nc 
    }
    
    func createTabbarVC()->UITabBarController {
        let vc = MyTabbarVC()
        vc.viewControllers = [ createFirstNC(), createSecondNC() ]
        return vc
    }
}

