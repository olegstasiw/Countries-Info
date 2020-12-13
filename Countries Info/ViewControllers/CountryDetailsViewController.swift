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
    
    @IBOutlet var colorViews: [UIView]!
    
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
        
        setUI()
    }
    
    private func setUI() {
        addBackButton()
        colorViews.forEach { $0.layer.cornerRadius = $0.frame.height / 2 }
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
        button.contentEdgeInsets = Constants.buttonEdgeInsets
        button.layer.cornerRadius = Constants.cornerRadius
        let origImage = UIImage(named: Constants.dotsImage)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = Constants.buttonImageEdgeInsets
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(showAll(sender:)), for: .touchUpInside)
    }
    
    @objc private func showAll(sender: UIButton) {
        switch sender {
        case is CurrenciesButton:
            let viewController = DependecyInjectionManager.shared.assembler.resolver.resolve(ShowAllViewController.self)!
            viewController.viewModel = ShowAllViewModel(list: viewModel.currencies, color: #colorLiteral(red: 0.9843137255, green: 0.8274509804, blue: 0.7529411765, alpha: 1))
            openViewController(viewController)
            
        case is LanguagesButton:
            let viewController = DependecyInjectionManager.shared.assembler.resolver.resolve(ShowAllViewController.self)!
            viewController.viewModel = ShowAllViewModel(list: viewModel.languages, color: #colorLiteral(red: 0.9843137255, green: 0.8274509804, blue: 0.7529411765, alpha: 1))
            openViewController(viewController)
            
        case is TimeZonesButton:
            let viewController = DependecyInjectionManager.shared.assembler.resolver.resolve(ShowAllViewController.self)!
            viewController.viewModel = ShowAllViewModel(list: viewModel.timeZones, color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1))
            openViewController(viewController)
            
        case is CallingCodesButton:
            let viewController = DependecyInjectionManager.shared.assembler.resolver.resolve(ShowAllViewController.self)!
            viewController.viewModel = ShowAllViewModel(list: viewModel.callingCodes, color: #colorLiteral(red: 0.6509803922, green: 0.9019607843, blue: 0.9921568627, alpha: 1))
            openViewController(viewController)
        default:
            break
        }
    }
    
    private func openViewController(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        viewController.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(viewController, animated: true, completion: nil)
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
    
    private func addBackButton() {
        let btnLeftMenu: UIButton = UIButton()
        let image = UIImage(named: Constants.backImage)
        btnLeftMenu.setImage(image, for: .normal)
        btnLeftMenu.sizeToFit()
        btnLeftMenu.addTarget(self, action: #selector (backButtonClick), for: .touchUpInside)
        let barButton = UIBarButtonItem(customView: btnLeftMenu)
        self.navigationItem.leftBarButtonItem = barButton
    }

    @objc private func backButtonClick() {
        self.navigationController?.popViewController(animated: true)
    }
    
}
