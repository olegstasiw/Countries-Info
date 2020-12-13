//
//  ShowAllViewModel.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 11.12.2020.
//

import Foundation
import UIKit

protocol ShowAllViewModelProtocol {
    var list: [String] { get }
    var color: UIColor { get }
    
    init(list: [String], color: UIColor)
}

class ShowAllViewModel: ShowAllViewModelProtocol {
    var list: [String]
    
    var color: UIColor
    
    required init(list: [String], color: UIColor) {
        self.list = list
        self.color = color
    }
}
