//
//  ViewControllersAssembly.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import UIKit
import Swinject

class ViewControllersAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CountriesListViewController.self) { r in
            let storyboard = UIStoryboard(name: Constants.storyboardId, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: Constants.viewControllerId) as! CountriesListViewController
            controller.viewModel = CountriesListViewModel(apollo: r.resolve(ApolloManager.self)!)
            return controller
        }
        
        container.register(CountryDetailsViewController.self) { _ in
            let storyboard = UIStoryboard(name: Constants.storyboardId, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: Constants.detailViewControllerId) as! CountryDetailsViewController
            return controller
        }
        
        container.register(ShowAllViewController.self) { _ in
            let storyboard = UIStoryboard(name: Constants.storyboardId, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: Constants.showAllViewControllerId) as! ShowAllViewController
            return controller
        }
    }
}
