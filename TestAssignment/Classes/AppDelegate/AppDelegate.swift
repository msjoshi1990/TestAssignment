//
//  AppDelegate.swift
//  TestAssignment
//
//  Created by Madhu sudan Joshi on 19/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootNav: BaseNavVC?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            window?.overrideUserInterfaceStyle = .light
        }
        return true
    }
}
