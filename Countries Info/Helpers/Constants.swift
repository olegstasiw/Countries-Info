//
//  Constants.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 07.12.2020.
//

import UIKit

struct EdgeInsetsConstants {
    //Edge insets for collectionView cells items
    static let sectionInsets = UIEdgeInsets(top: 20, left: 13, bottom: 20, right: 13)
    //Edge insets for buttons Image
    static let buttonImageEdgeInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    //Edge insets for Button
    static let buttonEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    //Edge insets for label in ShowAll Screen
    static let labelEdgeInsetsForShowAllScreen = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
}

struct SizeConstants {
    //Item per row in Collection View
    static let itemPerRow: CGFloat = 1
    //Items height in Collection View
    static let cellHeight: CGFloat = 190
    //Height required to display ShowAll Screen
    static let height: CGFloat = 86
    //Spacing between labels, stacks
    static let spacing: CGFloat = 7
    //Corner radius for cells in collection view and contentView in ShowAll Screen
    static let cornerRadius: CGFloat = 15
    //Corner radius for image
    static let imageCornerRadius: CGFloat = 5
}

struct StaticValueConstants{
    //Static value of one million
    static let million: Double = 1000000
    //Static value of one thousand
    static let thousand: Double = 1000
}

struct NameConstants {
    //Name of the Back image
    static let backImage = "backImg"
    //Name of the Three dots image
    static let dotsImage = "dots"
    //Name of the Roboto regular font
    static let roboto = "Roboto-Regular"
    
    //Name of the Country cell id
    static let cellId = "CountryViewCell"
    //Name of the Countries List View Controller id
    static let viewControllerId = "CountriesListViewController"
    //Name of the Country Details View Controller id
    static let detailViewControllerId = "CountryDetailsViewController"
    //Name of the ShowAll View Controller id
    static let showAllViewControllerId = "ShowAllViewController"
    //Name of storyboard
    static let storyboardId = "Main"
}
