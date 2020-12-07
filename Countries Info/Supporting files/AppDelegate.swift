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
    private let assembler = DependecyInjectionManager.shared.assembler
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        let window = UIWindow()
        window.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: assembler.resolver.resolve(CountriesListViewController.self)!)
        window.rootViewController = navigationController
            self.window = window
        
        return true
    }
}

