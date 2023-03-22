//
//  ImageFactory.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 17.12.2020.
//

import Foundation

protocol ImageFactoryProtocol {
    func imageGenerator(code: String?, completion: @escaping (Data?) -> Void)
}

class ImageFactory: ImageFactoryProtocol {
    func imageGenerator(code: String?, completion: @escaping (Data?) -> Void) {
        if let string = code {
            guard let url = URL(string: "\(NameConstants.imageURL)\(string)\(NameConstants.imageExtension)") else { return }
            let data = try? Data(contentsOf: url)
            completion(data)
        }
    }
}

