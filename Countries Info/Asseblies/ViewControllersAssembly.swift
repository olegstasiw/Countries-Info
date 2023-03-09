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
            let storyboard = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: NameConstants.viewControllerId) as! CountriesListViewController
            controller.viewModel = CountriesListViewModel(apollo: r.resolve(ApolloManager.self)!)
            return controller
        }
        
        container.register(CountryDetailsViewController.self) { _ in
            let storyboard = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: NameConstants.detailViewControllerId) as! CountryDetailsViewController
            return controller
        }
        
        container.register(ShowAllViewController.self) { _ in
            let storyboard = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
            let controller = storyboard.instantiateViewController(withIdentifier: NameConstants.showAllViewControllerId) as! ShowAllViewController
            return controller
        }
    }
}
