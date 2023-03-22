//
//  ApolloAssembly.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import Foundation
import Swinject

class ApolloAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ApolloManager.self) { _ in
            ApolloManager()
        }
    }
}
