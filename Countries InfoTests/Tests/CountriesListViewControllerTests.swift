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
    
}

