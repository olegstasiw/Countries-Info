//
//  DependecyInjection.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import Foundation
import  Swinject

class DependecyInjectionManager {
    static let shared = DependecyInjectionManager()
    
    let assembler = Assembler([
        ApolloAssembly(),
        ViewControllersAssembly(),
        FactoryAssembly()
    ])
    
}
