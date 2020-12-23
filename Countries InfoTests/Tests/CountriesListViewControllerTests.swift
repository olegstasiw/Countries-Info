//
//  CountriesListViewControllerTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 21.12.2020.
//

import XCTest
import Cuckoo
import Swinject
import Apollo
@testable import Countries_Info

class CountriesListViewControllerTests: XCTestCase {
    
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
    
    func testWhenViewIsLoadedCollectionViewNotNil() {
        XCTAssertNotNil(sut.countriesCollectionView)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateIsSet() {
        XCTAssertNotNil(sut.countriesCollectionView.delegate is CountriesListViewController)
    }
    
    func testWhenViewIsLoadedCollectionViewDataSourceIsSet() {
        XCTAssertNotNil(sut.countriesCollectionView.dataSource is CountriesListViewController)
    }
    
    func testWhenViewIsLoadedCollectionViewDelegateIsEqualsCollectionViewDataSourse() {
        XCTAssertEqual(sut.countriesCollectionView.delegate as? CountriesListViewController, sut.countriesCollectionView.dataSource as? CountriesListViewController)
    }
    
    func testSutConformsToCollectionViewDataSource() {
        XCTAssert(sut.conforms(to: UICollectionViewDataSource.self))
        XCTAssertTrue(sut.responds(to: (#selector(sut.collectionView(_:numberOfItemsInSection:)))))
        XCTAssertTrue(sut.responds(to: (#selector(sut.collectionView(_:cellForItemAt:)))))
    }
    
    func testSutConformsToCollectionViewDelegate() {
        
        XCTAssert(sut.conforms(to: UICollectionViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:didSelectItemAt:))))
    }
    
    func testSutConformsToCollectionViewDelegateFlowLayout () {
        
        XCTAssert(sut.conforms(to: UICollectionViewDelegateFlowLayout.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.collectionView(_:layout:sizeForItemAt:))))
        XCTAssertTrue(sut.responds(to:#selector(sut.collectionView(_:layout:insetForSectionAt:))))
        XCTAssertTrue(sut.responds(to:#selector(sut.collectionView(_:layout:minimumLineSpacingForSectionAt:))))
        XCTAssertTrue(sut.responds(to:#selector(sut.collectionView(_:layout:minimumInteritemSpacingForSectionAt:))))
    }
    
    func testNumberOfSection() {
        let mockApolloManager = ApolloManagerMock()
        sut.viewModel  = CountriesListViewModel(apollo: mockApolloManager)
        
        let numberOfsection = sut.countriesCollectionView.numberOfSections
        XCTAssertEqual(numberOfsection, 1)
    }
    
    func testNumberOfItem() {
        let mockApolloManager = ApolloManagerMock()
        sut.viewModel  = CountriesListViewModel(apollo: mockApolloManager)
        
        sut.viewModel.countries.append(Country(name: "Foo", capital: "Bar", population: 10, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "uk", subregion: nil))
        XCTAssertEqual(sut.countriesCollectionView.numberOfItems(inSection: 0), 2)
        sut.viewModel.countries.append(Country(name: "Foo", capital: "Bar", population: 10, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "uk", subregion: nil))
        sut.countriesCollectionView.reloadData()
        XCTAssertEqual(sut.countriesCollectionView.numberOfItems(inSection: 0), 3)
    }
    
    func testCellForItem() {
        let mockApolloManager = ApolloManagerMock()
        sut.viewModel  = CountriesListViewModel(apollo: mockApolloManager)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.countriesCollectionView.dataSource?.collectionView(sut.countriesCollectionView, cellForItemAt: indexPath) as? CountryViewCell
        XCTAssertEqual(cell?.countryNameLabel.text , sut.viewModel.countries.first?.name)
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
        sut.viewModel = CountriesListViewModel(apollo: ApolloManager())
        sut.viewModel.countries.append(Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: nil))
        let img = ImageFactory()
        
        let cell = sut.countriesCollectionView.dataSource?.collectionView(sut.countriesCollectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? CountryViewCell
        cell?.factory = img
        sut.loadViewIfNeeded()
    
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
        sut.viewModel = CountriesListViewModel(apollo: ApolloManager())
        sut.viewModel.countries.append(Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br4455", subregion: nil))
        let img = ImageFactory()
        
        let cell = sut.countriesCollectionView.dataSource?.collectionView(sut.countriesCollectionView, cellForItemAt: IndexPath(item: 0, section: 0)) as? CountryViewCell
        cell?.factory = img
        sut.loadViewIfNeeded()
    
        img.imageGenerator(code: "br") { (data) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                XCTAssertEqual(cell?.flagImageView.image, UIImage(named: NameConstants.unknownFlagImage))
                expectation.fulfill()
            })
        }

        waitForExpectations(timeout: 20, handler: nil)
        XCTAssertNotNil(img)

    }
    
    func testPushToDetailViewController() {
        let mockApolloManager = ApolloManagerMock()
        sut.viewModel  = CountriesListViewModel(apollo: mockApolloManager)
        
        let mocNavController = MockPushNavigationController(rootViewController: sut)
        
        sut.collectionView(sut.countriesCollectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
        let controller = mocNavController.pushedNavControllrer as? CountryDetailsViewController
        
        guard let detailViewController = controller else { XCTFail(); return  }
        detailViewController.loadViewIfNeeded()
        XCTAssertNotNil(detailViewController.nameLabel)
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

