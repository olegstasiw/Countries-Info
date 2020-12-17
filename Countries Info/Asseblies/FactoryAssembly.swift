//
//  FactoryAssembly.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 17.12.2020.
//

import Foundation
import Swinject

class FactoryAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ImageFactoryProtocol.self) { _ in
            ImageFactory()
        }
    }
}
