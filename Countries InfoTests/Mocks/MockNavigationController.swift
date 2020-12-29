//
//  MockNavigationController.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import UIKit
import XCTest

class MockNavigationController: UINavigationController {
    var expectation: XCTestExpectation?
    
    override func popViewController(animated: Bool) -> UIViewController? {
        expectation?.fulfill()
        return super.popViewController(animated: animated)
    }
}
