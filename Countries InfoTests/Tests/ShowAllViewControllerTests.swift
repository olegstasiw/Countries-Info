//
//  ShowAllviewControllerTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import XCTest
import Cuckoo
import Swinject
import Apollo
@testable import Countries_Info

class ShowAllViewControllerTests: XCTestCase {

    var sut: ShowAllViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: NameConstants.showAllViewControllerId)
        sut = vc as? ShowAllViewController
    }

    override func tearDownWithError() throws {
       sut = nil
    }

    func testCloseButtonPress() {
        let expectation = XCTestExpectation(description: "This Work")
        let controller = MockViewController()
        controller.expectation = expectation
        controller.closeButtonPress()
       
        wait(for: [expectation], timeout: 5)
    }
}

