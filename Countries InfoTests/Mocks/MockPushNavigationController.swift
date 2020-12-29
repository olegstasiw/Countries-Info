//
//  MockPushNavigationController.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import UIKit

class MockPushNavigationController: UINavigationController {
    var pushedNavControllrer: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedNavControllrer = viewController
        super.pushViewController(viewController, animated: animated)
    }
}
