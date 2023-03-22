//
//  CountriesListViewModel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import Foundation
import Combine

protocol CountriesListViewModelProtocol {
    var countriesPublisher: Published<[Country]>.Publisher { get }
    var countries: [Country] { get set }
    
    func numberOfItem() -> Int
    func cellViewModel(indexPath: IndexPath) -> CountryCollectionViewCellViewModelProtocol?
    func fetch()
}

class CountriesListViewModel: CountriesListViewModelProtocol, ObservableObject {
    
    @Published var countries: [Country] = []
    var countriesPublisher: Published<[Country]>.Publisher { $countries }
    var cancellable: AnyCancellable?
    private let apollo: ApolloManager
    private var indexPath: IndexPath = IndexPath()
    
    init(apollo: ApolloManager) {
        self.apollo = apollo
        self.fetch()
    }
    
    func fetch() {
        cancellable = Future<AllCountries, Error> { some in
            self.apollo.fetch(query: AllCountriesQuery(), type: AllCountries.self){ (data) in
                return some(.success(data))
            }
        }
        .sink(receiveCompletion:{ _ in}, receiveValue: { (allCountries) in
            self.countries = allCountries.country
        })
    }
    
    func numberOfItem() -> Int {
        countries.count
    }
    
    func cellViewModel(indexPath: IndexPath) -> CountryCollectionViewCellViewModelProtocol? {
        return CountryCollectionViewCellViewModel(country: countries[indexPath.row])
    }
}
