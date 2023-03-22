//
//  ApolloManagerTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 29.12.2020.
//

import XCTest
import Apollo
@testable import Countries_Info

class ApolloManagerTests: XCTestCase {
    
    var sut: CountriesListViewController!
    
    override func setUpWithError() throws {
        super.setUp()
        
        let storyboard = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: NameConstants.viewControllerId)
        sut = vc as? CountriesListViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testApolloManagerNetworkFetch() {
        let apManager = ApolloManager()
        
        let expectation = self.expectation(description: "This worked")
        
        apManager.fetch(query: AllCountriesQuery(), type: AllCountries.self) { (countries) in
            for country in countries.country {
                print(country.name)
            }
            expectation.fulfill()
        }
        
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testApolloManagerFetch() {
        let apManager = ApolloManagerMock()
        
        let expectation = self.expectation(description: "This worked")
        
        apManager.fetch(query: AllCountriesQuery(), type: AllCountries.self) { (countries) in
            for country in countries.country {
                print(country.name)
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchIsCalled() {
        let mockApolloManager = ApolloManagerMock()
        let expe = XCTestExpectation(description: "This Work")
        mockApolloManager.expectation = expe
        sut.viewModel  = CountriesListViewModel(apollo: mockApolloManager)
        wait(for: [expe], timeout: 5)
    }
    
    func testFetchCompletionNotNil() {
        let mockApolloManager = ApolloManagerMock()
        sut.viewModel  = CountriesListViewModel(apollo: mockApolloManager)
        
        mockApolloManager.fetch(query: AllCountriesQuery(), type: AllCountries.self) { (countries) in
            XCTAssertNotNil(countries)
        }
    }

}
