//
//  ModelTests.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import XCTest
@testable import Countries_Info

class ModelTests: XCTestCase {

    func testEncodeAllCountries() {
        let encoder = JSONEncoder()
        let model = AllCountries(country: [Country(name: "Foo", capital: "Bar", population: 10, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "uk", subregion: nil)])
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    func testEncodeCountry() {
        let encoder = JSONEncoder()
        let model = Country(name: "Foo", capital: "Bar", population: 10, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "uk", subregion: nil)
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    
    func testEncodeCurrencie() {
        let encoder = JSONEncoder()
        let model = Currencie(name: "Foo")
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    
    func testEncodeOfficialLanguage() {
        let encoder = JSONEncoder()
        let model = OfficialLanguage(name: "Foo")
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    
    func testEncodeTimezone() {
        let encoder = JSONEncoder()
        let model = Timezone(name: "Foo")
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    
    func testEncodeCallingCode() {
        let encoder = JSONEncoder()
        let model = CallingCode(name: "Foo")
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    
    func testEncodeRegion() {
        let encoder = JSONEncoder()
        let region = Region(name: "Foo")
        let model = Subregion(region: region)
        let data = try? encoder.encode(model)
        XCTAssertNotNil(data)
    }
    
    
}


