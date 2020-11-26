//
//  AllCountry.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 26.11.2020.
//

import Foundation

struct AllCountry: Codable {
    let country: [Country]
    private enum CodingKeys: String, CodingKey {
        case country = "Country"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode([Country].self, forKey: .country).compactMap { $0 }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(country, forKey: .country)
    }
}

struct Country: Codable {
    let name: String
    let capital: String
    let population: Double
    let currencies: [Currencie]
    let officialLanguages: [OfficialLanguage]
    let timezones: [Timezone]
    let callingCodes: [CallingCode]
    let flag: Flag
    let subregion: Subregion?
    
    private enum CodingKeys: String, CodingKey {
        case name, capital, population, currencies, officialLanguages, timezones, callingCodes, flag, subregion
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
        flag = try container.decode(Flag.self, forKey: .flag)
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
        try container.encode(flag, forKey: .flag)
        try container.encode(subregion, forKey: .subregion)
    }
}

struct Currencie: Codable {
    let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

struct Flag: Codable {
    let svgFile: String
    
    private enum CodingKeys: String, CodingKey {
        case svgFile
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        svgFile = try container.decode(String.self, forKey: .svgFile)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(svgFile, forKey: .svgFile)
    }
}


struct Subregion: Codable {
    let region: Region
    
    private enum CodingKeys: String, CodingKey {
        case region
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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
