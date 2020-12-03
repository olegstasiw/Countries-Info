//
//  ViewControllerAssembly.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import UIKit
import Swinject

class ViewControllerAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CountriesListViewController.self) { r in
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: "CountriesListViewController") as! CountriesListViewController
            controller.viewModel = CountriesListViewModel(apollo: r.resolve(ApolloManager.self)!)
            return controller
        }
    }
}
