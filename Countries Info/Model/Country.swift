//
//  Country.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 01.12.2020.
//

import Foundation

struct Country: Codable {
    let name: String
    let capital: String
    let population: Double
    let currencies: [Currencie]
    let officialLanguages: [OfficialLanguage]
    let timezones: [Timezone]
    let callingCodes: [CallingCode]
    let alpha2Code: String
    let subregion: Subregion?
    
    private enum CodingKeys: String, CodingKey {
        case name, capital, population, currencies, officialLanguages, timezones, callingCodes, subregion, alpha2Code
    }
    
    
    init(name: String, capital: String, population: Double, currencies: [Currencie], officialLanguages: [OfficialLanguage], timezones: [Timezone], callingCodes: [CallingCode], alpha2Code: String, subregion: Subregion?) {
        self.name = name
        self.capital = capital
        self.population = population
        self.currencies = currencies
        self.officialLanguages = officialLanguages
        self.timezones = timezones
        self.callingCodes = callingCodes
        self.alpha2Code = alpha2Code
        self.subregion = subregion
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        capital = try container.decode(String.self, forKey: .capital)
        population = try container.decode(Double.self, forKey: .population)
        currencies = try container.decode([Currencie].self, forKey: .currencies)
        officialLanguages = try container.decode([OfficialLanguage].self, forKey: .officialLanguages)
        timezones = try container.decode([Timezone].self, forKey: .timezones)
        callingCodes = try container.decode([CallingCode].self, forKey: .callingCodes)
        alpha2Code = try container.decode(String.self, forKey: .alpha2Code)
        subregion = try container.decode(Subregion?.self, forKey: .subregion)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(capital, forKey: .capital)
        try container.encode(population, forKey: .population)
        try container.encode(currencies, forKey: .currencies)
        try container.encode(officialLanguages, forKey: .officialLanguages)
        try container.encode(timezones, forKey: .timezones)
        try container.encode(callingCodes, forKey: .callingCodes)
        try container.encode(alpha2Code, forKey: .alpha2Code)
        try container.encode(subregion, forKey: .subregion)
    }
}

struct Currencie: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(name: String) {
        self.name = name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct OfficialLanguage: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(name: String) {
        self.name = name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Timezone: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(name: String) {
        self.name = name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct CallingCode: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(name: String) {
        self.name = name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Subregion: Codable {
    let region: Region
    
    private enum CodingKeys: String, CodingKey {
        case region
    }
    
    init(region: Region) {
        self.region = region
    }
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        region = try container.decode(Region.self, forKey: .region)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(region, forKey: .region)
    }
}

struct Region: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
    
    init(name: String) {
        self.name = name
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
