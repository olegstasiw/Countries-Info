//
//  NewColor.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 14.12.2020.
//

import UIKit

typealias ColorType = (red: CGFloat, green: CGFloat, blue: CGFloat)

enum NewColor {
    case yellow, orange, green, blue
    
    var color: ColorType {
        switch self {
        case .yellow:
            return (1, 0.8941176471, 0.6431372549)
        case .orange:
            return (0.9843137255, 0.8274509804, 0.7529411765)
        case .green:
            return (0.7254901961, 0.9176470588, 0.7647058824)
        case .blue:
            return (0.6509803922, 0.9019607843, 0.9921568627)
        }
}
}
