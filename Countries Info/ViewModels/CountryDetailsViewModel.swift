//
//  CountryDetailsViewModel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 08.12.2020.
//

import Foundation

protocol CountryDetailsViewModelProtocol {
    var countryName: String { get }
    var capital: String { get }
    var region: String { get }
    var population: String { get }
    var currencies: [String] { get }
    var languages: [String] { get }
    var timeZones: [String] { get }
    var callingCodes: [String] { get }
    var flag: String? { get }
    
    init(country: Country)
}

class CountryDetailsViewModel: CountryDetailsViewModelProtocol {
    
    var countryName: String {
        country.name
    }
    var capital: String {
        country.capital
    }
    var region: String {
        country.subregion?.region.name ?? ""
    }
    var population: String {
        String(setPoputation(population: country.population))
    }
    
    var currencies: [String] {
        var array: [String] = []
        country.currencies.forEach { array.append($0.name) }
        return array
    }
    
    var languages: [String] {
        var array: [String] = []
        country.officialLanguages.forEach { array.append($0.name) }
        return array
    }
    var timeZones: [String] {
        var array: [String] = []
        country.timezones.forEach { array.append(setGMTTimeZone(zone: $0.name)) }
        return array
    }
    var callingCodes: [String] {
        var array: [String] = []
        country.callingCodes.forEach { array.append("+\($0.name)") }
        return array
    }
    var flag: String? {
        return country.flag.svgFile
    }
    
    private let country: Country
    
    required init(country: Country) {
        self.country = country
    }
    
    private func setGMTTimeZone(zone: String) -> String {
        var timeZone = zone
        let formatter = DateFormatter()
        formatter.dateFormat = "H:mm"
        if let utc = zone.range(of: "UTC") {
            timeZone.removeSubrange(utc)
            if let plus = timeZone.range(of: "+") {
                timeZone.removeSubrange(plus)
                let date = formatter.date(from: timeZone)
                timeZone = "GMT + \(formatter.string(from: date ?? Date()))"
                return timeZone
            } else if let minus = timeZone.range(of: "-") {
                timeZone.removeSubrange(minus)
                let date = formatter.date(from: timeZone)
                timeZone = "GMT - \(formatter.string(from: date ?? Date()))"
                return timeZone
            } else if timeZone.isEmpty {
                timeZone = "GMT + 0"
                return timeZone
            }
        }
        return timeZone
    }
    
    
    private func setPoputation(population: Double) -> String {
        var number = population
        if population > Constants.million {
            number /= Constants.million
            let str = String(number.rounded(toPlaces: 2)) + " m"
            return str.replacingOccurrences(of: ".", with: ",")
            
        } else {
            number /= Constants.thousand
            let str = String(number.rounded(toPlaces: 2)) + " k"
            return str.replacingOccurrences(of: ".", with: ",")
        }
    }
    
    
}
