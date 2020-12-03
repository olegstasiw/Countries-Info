//
//  CountryCollectionViewCell.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import UIKit

class CountryCollectionViewCell: UICollectionViewCell {
    
    var viewModel: CountryCollectionViewCellViewModelProtocol? {
        didSet {
            setUI()
            //label.text = viewModel.some
        }
    }
    
    private func setUI() {
        contentView.backgroundColor = .brown
        contentView.layer.cornerRadius = 30
    }
}
