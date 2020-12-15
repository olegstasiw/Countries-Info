//
//  ShowAllViewModel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 11.12.2020.
//

import Foundation

protocol ShowAllViewModelProtocol {
    var list: [String] { get }
    var color: NewColor { get }
    
    init(list: [String], color: NewColor)
}

class ShowAllViewModel: ShowAllViewModelProtocol {
    
    var color: NewColor
    var list: [String]
    
    required init(list: [String], color: NewColor) {
        self.list = list
        self.color = color
    }
}
