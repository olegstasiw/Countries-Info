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
    private (set) lazy var apollo = ApolloClient(url: url!)
    
    func fetch<Query: GraphQLQuery, T: Codable>(query: Query, type: T.Type, completion: @escaping(T) -> Void) {
        apollo.fetch(query: query) { result in
            guard let data = try? result.get().data else { return }
            
            let json = data.jsonObject
            let serialized = try! JSONSerialization.data(withJSONObject: json, options: [.prettyPrinted])
            
            let result = self.decodeJSON(type: type, from: serialized)
            guard let some = result else { return }
          
            completion(some)
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from,
              let response = try? decoder.decode(type.self, from: data) else { return nil}

        return response
      }
}
