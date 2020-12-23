//
//  AllCountry.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 26.11.2020.
//

import Foundation

struct AllCountries: Codable {
    let country: [Country]
    private enum CodingKeys: String, CodingKey {
        case country = "Country"
    }
    
    init(country: [Country]) {
        self.country = country
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
