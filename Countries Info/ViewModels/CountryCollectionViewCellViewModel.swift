//
//  CountryCollectionViewCellViewModel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import Foundation

protocol CountryCollectionViewCellViewModelProtocol {
    var countryName: String { get }
    var capital: String { get }
    var region: String { get }
    var alpha2Code: String { get }
    
    init(country: Country)
}

class CountryCollectionViewCellViewModel: CountryCollectionViewCellViewModelProtocol {
    var countryName: String {
        if country.name == "" { return "No name" }
        return country.name
    }
    var capital: String {
        if country.capital == "" { return "No capital" }
        return country.capital
    }
    var region: String {
        country.subregion?.region.name ?? "No region"
    }

    var alpha2Code: String {
        return country.alpha2Code.lowercased()
    }
    
    private let country: Country
    
    required init(country: Country) {
        self.country = country
    }
}
