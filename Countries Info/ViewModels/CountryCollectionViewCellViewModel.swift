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
    var flag: String? { get }
    
    init(country: Country)
}

class CountryCollectionViewCellViewModel: CountryCollectionViewCellViewModelProtocol {
    var countryName: String {
        country.name
    }
    var capital: String {
        country.capital
    }
    var region: String {
        country.subregion?.region.name ?? ""
    }

    var flag: String? {
        return country.flag.svgFile
    }
    private let country: Country
    
    required init(country: Country) {
        self.country = country
    }
}
