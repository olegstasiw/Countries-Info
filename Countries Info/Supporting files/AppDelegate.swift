//
//  AppDelegate.swift
//  Countries Info
//
//  Created by mac on 23.11.2020.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let DIAssabler = DependecyInjectionManager.shared.assembler
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow()
        window.makeKeyAndVisible()
        window.rootViewController = DIAssabler.resolver.resolve(CountriesListViewController.self)
        self.window = window
        
        return true
    }
}

