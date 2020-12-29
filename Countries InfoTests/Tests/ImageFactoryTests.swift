//
//  ImageFactoryTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 29.12.2020.
//

import XCTest
import Cuckoo
@testable import Countries_Info

class ImageFactoryTests: XCTestCase {
    
    var sutCountriesList: CountriesListViewController!
    var sutCountryDetail: CountryDetailsViewController!
    
    override func setUpWithError() throws {
        
        let storyboardCountriesList = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
        let vcCountriesList = storyboardCountriesList.instantiateViewController(identifier: NameConstants.viewControllerId)
        sutCountriesList = vcCountriesList as? CountriesListViewController
        sutCountriesList.loadViewIfNeeded()
        
        
        
        
        let storyboardCountryDetail = UIStoryboard(name: NameConstants.storyboardId, bundle: nil)
        let vcCountryDetail = storyboardCountryDetail.instantiateViewController(identifier: NameConstants.detailViewControllerId)
        sutCountryDetail = vcCountryDetail as? CountryDetailsViewController
        let longName = NameConstants.longName
        sutCountryDetail.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 10, currencies: [Currencie(name: longName)], officialLanguages: [OfficialLanguage(name: longName)], timezones: [Timezone(name: longName), Timezone(name: longName), Timezone(name: longName), Timezone(name: longName), Timezone(name: longName)], callingCodes: [CallingCode(name: longName)], alpha2Code: "222", subregion: nil))
    }

    override func tearDownWithError() throws {
        sutCountriesList = nil
        sutCountryDetail = nil
    }

    func testImageDataIsNil()  {
        let expectation = self.expectation(description: "This worked")
        var image: UIImage? = nil
        
        let imageMock = MockImageFactory()
        stub(imageMock) { (mock) in
            mock.imageGenerator(code: anyString(), completion: anyClosure()).then { (_, handler) in
                handler(nil)
            }
        }
        imageMock.imageGenerator(code: "897789") { (data) in
            XCTAssertNil(data)
                if let img = UIImage(named: NameConstants.unknownFlagImage) {
                    image = img
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(image)
    }
    
    func testImageDataIsNotNil()  {
        let expectation = self.expectation(description: "This worked")
        
        let imageMock = MockImageFactory()
        stub(imageMock) { (mock) in
            mock.imageGenerator(code: anyString(), completion: anyClosure()).then { (_, handler) in
                handler(Data())
            }
        }
        imageMock.imageGenerator(code: "uk") { (data) in
            expectation.fulfill()
            XCTAssertNotNil(data)
        }
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(imageMock)
    }
    
    func testImageDataFromNetworkWhenDataIsCorrect()  {
        
        let expectation = self.expectation(description: "This worked")
        sutCountriesList.viewModel = CountriesListViewModel(apollo: ApolloManager())
        sutCountriesList.viewModel.countries.append(Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: nil))
        let img = ImageFactory()
        
        let cell = sutCountriesList.countriesCollectionView.dataSource?.collectionView(sutCountriesList.countriesCollectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? CountryViewCell
        cell?.factory = img
        sutCountriesList.loadViewIfNeeded()
    
        img.imageGenerator(code: "br") { (data) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                XCTAssertNotNil(cell?.flagImageView.image)
                expectation.fulfill()
            })
        }

        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertNotNil(img)
    }
    
    func testImageDataFromNetworkWhenDataIsNotCorrect()  {
        let expectation = self.expectation(description: "This worked")
        sutCountriesList.viewModel = CountriesListViewModel(apollo: ApolloManager())
        sutCountriesList.viewModel.countries.append(Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br4455", subregion: nil))
        let img = ImageFactory()
        
        let cell = sutCountriesList.countriesCollectionView.dataSource?.collectionView(sutCountriesList.countriesCollectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? CountryViewCell
        cell?.factory = img
        sutCountriesList.loadViewIfNeeded()
    
        img.imageGenerator(code: "br") { (data) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                XCTAssertEqual(cell?.flagImageView.image, UIImage(named: NameConstants.unknownFlagImage))
                expectation.fulfill()
            })
        }

        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertNotNil(img)

    }
    
    func testImageDataFromNetworkInCountryDetailViewWhenDataIsNotCorrect()  {
        
        let expectation = self.expectation(description: "This worked")
        let img = ImageFactory()

        sutCountryDetail.factory = img
        sutCountryDetail.loadViewIfNeeded()
    
        DispatchQueue.main.async {
            XCTAssertNotNil(self.sutCountryDetail.flagImageView.image)
            XCTAssertEqual(self.sutCountryDetail.flagImageView.image, UIImage(named: NameConstants.unknownFlagImage))
            expectation.fulfill()
        }
  
        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(img)
    }
    func testImageDataFromNetworkInCountryDetailViewWhenDataIsCorrect()  {
    
        let expectation = self.expectation(description: "This worked")
        sutCountryDetail.viewModel = CountryDetailsViewModel(country: Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: nil))
        let img = ImageFactory()
        
        sutCountryDetail.factory = img
        sutCountryDetail.loadViewIfNeeded()
    
        img.imageGenerator(code: "br") { (data) in
            DispatchQueue.main.async {
                XCTAssertNotNil(self.sutCountryDetail.flagImageView.image)
                expectation.fulfill()
            }
        }

        waitForExpectations(timeout: 10, handler: nil)
        XCTAssertNotNil(img)
    }
    
    
    
    

}
