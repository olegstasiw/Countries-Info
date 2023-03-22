//
//  ApolloManagerMock.swift
//  Countries InfoTests
//
//  Created by Oleh Stasiv on 23.12.2020.
//

import UIKit
import Apollo
import XCTest
@testable import Countries_Info

class ApolloManagerMock: ApolloManager {
    var expectation: XCTestExpectation?
    
    override func fetch<Query, T>(query: Query, type: T.Type, completion: @escaping (T) -> Void) where Query : GraphQLQuery, T : Decodable, T : Encodable {
        
        let country = Country(name: "Foo", capital: "Bar", population: 10, currencies: [], officialLanguages: [], timezones: [], callingCodes: [], alpha2Code: "br", subregion: nil)
        let allCountries = AllCountries(country: [country])
        
        if type is AllCountries.Type && query is AllCountriesQuery {
            completion(allCountries as! T)
            expectation?.fulfill()
        }
    }
}
