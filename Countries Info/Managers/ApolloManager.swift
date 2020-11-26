//
//  ApolloManager.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 26.11.2020.
//

import Foundation
import Apollo

class ApolloManager {
    
    static let shared = ApolloManager()
    
    private let url = URL(string: "https://countries-274616.ew.r.appspot.com/")
    lazy var apollo = ApolloClient(url: url!)
    
    func fetchCountry(completion: @escaping([Country]) -> Void) {
        
        apollo.fetch(query: MyCountryQueryQuery()) { result in
            guard let data = try? result.get().data else { return }
            
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
            
            let JSONDecode = JSONDecoder()
            do {
                let countries = try JSONDecode.decode(AllCountry.self, from: serialized).country
                completion(countries)
            } catch let error {
                print("Erorr: \(error.localizedDescription)")
            }
        }
    }
}
