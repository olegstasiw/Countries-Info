//
//  MockViewController.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import UIKit
import XCTest
@testable import Countries_Info

class MockViewController: ShowAllViewController {
    
    var expectation: XCTestExpectation?
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        expectation?.fulfill()
    }
}
