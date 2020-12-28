//
//  CountryDetailsTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 22.12.2020.
//

import XCTest
import Cuckoo
import Swinject
import Apollo
@testable import Countries_Info

class CountryDetailsTests: XCTestCase {
    
    
    var sut: CountryDetailsViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: NameConstants.detailViewControllerId)
        sut = vc as? CountryDetailsViewController
        let longName = NameConstants.longName
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 10, currencies: [Currencie(name: longName)], officialLanguages: [OfficialLanguage(name: longName)], timezones: [Timezone(name: longName), Timezone(name: longName), Timezone(name: longName), Timezone(name: longName), Timezone(name: longName)], callingCodes: [CallingCode(name: longName)], alpha2Code: "222", subregion: nil))
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    private func makeRootViewController() {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows
            .filter({$0.isKeyWindow}).first
        keyWindow?.rootViewController = sut
    }
    
    private func returnShowAllScreen() -> ShowAllViewController {
        guard let controller = sut.presentedViewController as? ShowAllViewController else { return ShowAllViewController()}
        return controller
    }
    
    func testImageDataFromNetworkWhenDataIsNotCorrect()  {
        
        let expectation = self.expectation(description: "This worked")
        let img = ImageFactory()
        
        sut.factory = img
        sut.loadViewIfNeeded()
    
        DispatchQueue.main.async {
            XCTAssertNotNil(self.sut.flagImageView.image)
            XCTAssertEqual(self.sut.flagImageView.image, UIImage(named: NameConstants.unknownFlagImage))
            expectation.fulfill()
        }
  
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(img)
    }
    func testImageDataFromNetworkWhenDataIsCorrect()  {
    
        let expectation = self.expectation(description: "This worked")
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: nil))
        let img = ImageFactory()
        
        sut.factory = img
        sut.loadViewIfNeeded()
    
        img.imageGenerator(code: "br") { (data) in
            DispatchQueue.main.async {
                XCTAssertNotNil(self.sut.flagImageView.image)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(img)
    }
    
    func testBackButtonCallPopViewController() {
        sut.loadViewIfNeeded()
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        let expectation = XCTestExpectation(description: "This Work")
        mockNavigationController.expectation = expectation
        
        let button = sut.navigationItem.leftBarButtonItem
        _ = button?.target?.perform(button?.action, with: nil)
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testShowAllCurrenciesLabels() {
        sut.loadViewIfNeeded()
        
        for view in sut.currenciesStack.arrangedSubviews {
            if view is UIButton {
                let button = view as? CurrenciesButton
                makeRootViewController()
                button?.sendActions(for: .touchUpInside)
                let controller = returnShowAllScreen()
                
                XCTAssertNotNil(controller.viewModel.list)
            }
        }
    }
    
    func testShowAllLanguagesLabels() {
        sut.loadViewIfNeeded()
        
        for view in sut.languagesStack.arrangedSubviews {
            if view is UIButton {
                let button = view as? LanguagesButton
                makeRootViewController()
                button?.sendActions(for: .touchUpInside)
                let controller = returnShowAllScreen()
                
                XCTAssertNotNil(controller.viewModel.list)
            }
        }
    }
    
    func testShowAllTimeZonesLabels() {
        sut.loadViewIfNeeded()
        
        for view in sut.timesZonesStack.arrangedSubviews {
            if view is UIButton {
                let button = view as? TimeZonesButton
                makeRootViewController()
                button?.sendActions(for: .touchUpInside)
                let controller = returnShowAllScreen()
                
                XCTAssertNotNil(controller.viewModel.list)
            }
        }
    }
    
    func testShowAllCodesLabels() {
        sut.loadViewIfNeeded()
        
        for view in sut.callingCodesStack.arrangedSubviews {
            if view is UIButton {
                let button = view as? CallingCodesButton
                makeRootViewController()
                button?.sendActions(for: .touchUpInside)
                let controller = returnShowAllScreen()
                
                XCTAssertNotNil(controller.viewModel.list)
            }
        }
    }
}

