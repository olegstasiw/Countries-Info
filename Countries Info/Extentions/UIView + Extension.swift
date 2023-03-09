//
//  UIView + Extension.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 06.12.2020.
//

import UIKit

extension UIView{
        func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
            clipsToBounds = true
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
            gradientLayer.frame = self.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            self.layer.insertSublayer(gradientLayer, at: 0)
            
        }
    }
