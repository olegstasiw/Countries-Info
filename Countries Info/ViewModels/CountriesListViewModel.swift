//
//  CountriesListViewModel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import Foundation

protocol CountriesListViewModelProtocol {
    var countries: [Country]? { get }
    
    func fetchResult(completion: @escaping() -> Void)
    func numberOfItem() -> Int
    func cellViewModel(indexPath: IndexPath) -> CountryCollectionViewCellViewModelProtocol?
}

class CountriesListViewModel: CountriesListViewModelProtocol {
    
    var countries: [Country]?
    
    private let apollo: ApolloManager
    
    init(apollo: ApolloManager) {
        self.apollo = apollo
    }
    
    func fetchResult(completion: @escaping () -> Void) {
        
        apollo.fetch(query: AllCountriesQuery(), type: AllCountries.self) { (result) in
            self.countries = result.country
            completion()
        }
    }
    
    func numberOfItem() -> Int {
        countries?.count ?? 0
    }
    
    func cellViewModel(indexPath: IndexPath) -> CountryCollectionViewCellViewModelProtocol? {
        guard let countries = countries else { return nil }
        return CountryCollectionViewCellViewModel(country: countries[indexPath.row])
    }
}
