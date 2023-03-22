//
//  PaddingLabelTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import XCTest
@testable import Countries_Info

class PaddingLabelTests: XCTestCase {

    func testInitWithCoder() {
        let someView = PaddingLabel(coder: NSCoder())
        XCTAssertNil(someView)
    }
    

}
