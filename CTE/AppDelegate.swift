//
//  AppDelegate.swift
//  CTE
//
//  Created by Leo Taylor on 7/9/23.
//

import UIKit

// In AppDelegate.swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
   let mainNavigationController = MainNavigationController()
   var window: UIWindow?
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainNavigationController
    window?.makeKeyAndVisible()
    return true
}
