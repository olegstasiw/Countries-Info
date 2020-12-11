//
//  CountryDetailsViewController.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 08.12.2020.
//
import UIKit

class CountryDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var currenciesStack: UIStackView!
    @IBOutlet weak var languagesStack: UIStackView!
    
    @IBOutlet weak var timesZonesStack: UIStackView!
    @IBOutlet weak var callingCodesStack: UIStackView!
    
    var viewModel: CountryDetailsViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = viewModel.countryName
        capitalLabel.text = viewModel.capital
        regionLabel.text = viewModel.region
        populationLabel.text = viewModel.population
        setValue(array: viewModel.currencies, stack: currenciesStack, color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6431372549, alpha: 1), type: CurrenciesButton.self)
        setValue(array: viewModel.languages, stack: languagesStack, color: #colorLiteral(red: 0.9843137255, green: 0.8274509804, blue: 0.7529411765, alpha: 1), type: LanguagesButton.self)
        setValue(array: viewModel.timeZones, stack: timesZonesStack, color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1), type: TimeZonesButton.self)
        setValue(array: viewModel.callingCodes, stack: callingCodesStack, color: #colorLiteral(red: 0.6509803922, green: 0.9019607843, blue: 0.9921568627, alpha: 1), type: CallingCodesButton.self)
        
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.tintColor = UIColor.black
        
        let img = UIImage(named: "backImg")
        navigationController?.navigationBar.backIndicatorImage = resizeImage(image: img!, newWidth: 16)
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = resizeImage(image: img!, newWidth: 16)
    }
    
    private func setValue(array: [String], stack: UIStackView, color: UIColor, type: UIButton.Type) {
        let button = type.init()
        setupButton(button)
        
        var width: CGFloat = button.intrinsicContentSize.width + Constants.spacing
        configureStack(stack)
        
        for text in array {
            let label = PaddingLabel(withInsets: Constants.padding, Constants.padding, Constants.padding, Constants.padding)
            configureLabel(label: label, text: text, color: color)
            width += label.intrinsicContentSize.width + Constants.spacing
            
            if width > stack.frame.width {
                stack.addArrangedSubview(button)
                addSpasingView(to: stack)
                return
            }  else {
                stack.addArrangedSubview(label)
            }
        }
        addSpasingView(to: stack)
    }
    
    private func setupButton(_ button: UIButton) {
        button.contentEdgeInsets = UIEdgeInsets(top: Constants.padding,
                                                left: Constants.padding,
                                                bottom: Constants.padding,
                                                right: Constants.padding)
        button.layer.cornerRadius = Constants.cornerRadius
        button.setTitle("...", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(showAll(sender:)), for: .touchUpInside)
    }
    
    @objc private func showAll(sender: UIButton) {
        switch sender {
        case is CurrenciesButton:
            print("1")
        case is LanguagesButton:
            print("2")
        case is TimeZonesButton:
            print("3")
        case is CallingCodesButton:
            print("4")
        default:
            break
        }
    }
    private func addSpasingView(to stack: UIStackView) {
        let spacerView = UIView()
        spacerView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stack.addArrangedSubview(spacerView)
    }
    
    private func configureStack(_ stack: UIStackView) {
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = Constants.spacing
        stack.layoutIfNeeded()
    }
    
    private func configureLabel(label: UILabel, text: String, color: UIColor) {
        label.text = text
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = Constants.cornerRadius
    }
    
    private func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
}

