//
//  CountryViewCell.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 03.12.2020.
//

import UIKit

class CountryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    
    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var countryStack: UIStackView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel: CountryCollectionViewCellViewModelProtocol? {
        didSet {
            configure()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    private func configure() {
        countryNameLabel.text = viewModel?.countryName
        capitalLabel.text = viewModel?.capital
        regionLabel.text = viewModel?.region
        DispatchQueue.global().async {
            self.imageGenerator(code: self.viewModel?.alpha2Code) { (data) in
                DispatchQueue.main.async {
                    if let imageData = data {
                        self.flagImageView.image = UIImage(data: imageData)
                    } else {
                        self.flagImageView.image = UIImage(named: NameConstants.unknownFlagImage)
                    }
                    self.activityIndicator.stopAnimating()
                    self.countryStack.isHidden = false
                    self.flagImageView.isHidden = false
                }
            }
        }
    }
    
    private func imageGenerator(code: String?, completion: @escaping (Data?) -> Void) {
        if let string = code {
            guard let url = URL(string: "\(NameConstants.imageURL)\(string)\(NameConstants.imageExtension)") else { return }
            let data = try? Data(contentsOf: url)
            completion(data)
        }
    }
    
    
    private func setUI() {
        setShadow()
        
        contentView.layer.cornerRadius = SizeConstants.cornerRadius
        flagImageView.layer.cornerRadius = SizeConstants.imageCornerRadius
        
        let firstColor = UIColor(red:255/255, green: 228/255, blue: 133/255, alpha: 0.5)
        let secondColor = UIColor(red:186/255, green: 123/255, blue: 0/255, alpha: 0.5)
        contentView.addGradientBackground(firstColor: firstColor, secondColor: secondColor)
        
        countryStack.isHidden = true
        flagImageView.isHidden = true
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
    }
    
    private func setShadow() {
        self.layer.cornerRadius = SizeConstants.cornerRadius
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
