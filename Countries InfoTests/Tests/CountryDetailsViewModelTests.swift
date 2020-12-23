//
//  CountryDetailsViewModelTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import XCTest
@testable import Countries_Info

class CountryDetailsViewModelTests: XCTestCase {
    
    var sut: CountryDetailsViewController!
    
    override func setUpWithError() throws {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "CountryDetailsViewController")
        sut = vc as? CountryDetailsViewController
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    
    func testReturnedDataFromViewModelTimeZoneWithPlusIsCorrect() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 100000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC+04:30")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        for i in sut.timesZonesStack.arrangedSubviews {
            if i is UILabel {
                let asd = i as? PaddingLabel
                XCTAssertEqual(asd?.text, "GMT + 4:30")
            }
        }
    }
    
    func testReturnedDataFromViewModelTimeZoneWithMinusIsCorrect() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 100000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC-04:30")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        for i in sut.timesZonesStack.arrangedSubviews {
            if i is UILabel {
                let asd = i as? PaddingLabel
                XCTAssertEqual(asd?.text, "GMT - 4:30")
            }
        }
    }
    
    func testReturnedDataFromViewModelTimeZoneIsCorrect() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 100000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        for i in sut.timesZonesStack.arrangedSubviews {
            if i is UILabel {
                let asd = i as? PaddingLabel
                XCTAssertEqual(asd?.text, "GMT + 0")
            }
        }
    }
    
    func testPupulationIsGreatestThenMillion() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 1000000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.populationLabel.text, "1,0 m")
    }
    
    func testPupulationIsLessThenMillion() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 100000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.populationLabel.text, "100,0 k")
    }
    
    func testLabelsIsEmpty() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "", capital: "", population: 0, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.nameLabel.text, "No name")
    }
    
    func testWhenTimeZoneIsNotCorrectWithPlus() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 100000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC+1")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        for i in sut.timesZonesStack.arrangedSubviews {
            if i is UILabel {
                let asd = i as? PaddingLabel
                XCTAssertEqual(asd?.text, "GMT + 0")
            }
        }
    }
    func testWhenTimeZoneIsNotCorrectWithMinus() {
        sut.viewModel = CountryDetailsViewModel(country: Country(name: "Foo", capital: "Bar", population: 100000, currencies: [Currencie(name: "test")], officialLanguages: [OfficialLanguage(name: "test")], timezones: [Timezone(name: "UTC-1")], callingCodes: [CallingCode(name: "380")], alpha2Code: "uk", subregion: nil))
        sut.loadViewIfNeeded()
        for i in sut.timesZonesStack.arrangedSubviews {
            if i is UILabel {
                let asd = i as? PaddingLabel
                XCTAssertEqual(asd?.text, "GMT + 0")
            }
        }
    }
}
