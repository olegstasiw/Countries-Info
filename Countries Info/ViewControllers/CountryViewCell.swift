//
//  CountryViewCell.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 03.12.2020.
//

import UIKit
import WebKit

class CountryViewCell: UICollectionViewCell, WKNavigationDelegate, UIWebViewDelegate {


    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryStack: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!


    var viewModel: CountryCollectionViewCellViewModelProtocol? {
        didSet {
                countryNameLabel.text = self.viewModel?.countryName
                capitalLabel.text = self.viewModel?.capital
                regionLabel.text = self.viewModel?.region
                
                if self.viewModel != nil {
                    activityIndicator.stopAnimating()
                    countryStack.isHidden = false
                    flagImageView.isHidden = false
                }  
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    private func setUI() {
        setShadow()
        
        contentView.layer.cornerRadius = 15
        flagImageView.layer.cornerRadius = 5
        
        let firstColor = UIColor(red:255/255, green: 228/255, blue: 133/255, alpha: 0.5)
        let secondColor = UIColor(red:186/255, green: 123/255, blue: 0/255, alpha: 0.5)
        contentView.addGradientBackground(firstColor: firstColor, secondColor: secondColor)
        
        countryStack.isHidden = true
        flagImageView.isHidden = true
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private func setShadow() {
        self.layer.cornerRadius = 15
        self.layer.borderWidth = 0.0
        self.layer.borderColor = UIColor.lightGray.cgColor

        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1.0, height: 4.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false
    }
}
