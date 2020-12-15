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
        setValue(allResult: viewModel.currencies, stack: currenciesStack, color: #colorLiteral(red: 1, green: 0.8941176471, blue: 0.6431372549, alpha: 1), buttonType: CurrenciesButton.self)
        setValue(allResult: viewModel.languages, stack: languagesStack, color: #colorLiteral(red: 0.9843137255, green: 0.8274509804, blue: 0.7529411765, alpha: 1), buttonType: LanguagesButton.self)
        setValue(allResult: viewModel.timeZones, stack: timesZonesStack, color: #colorLiteral(red: 0.7254901961, green: 0.9176470588, blue: 0.7647058824, alpha: 1), buttonType: TimeZonesButton.self)
        setValue(allResult: viewModel.callingCodes, stack: callingCodesStack, color: #colorLiteral(red: 0.6509803922, green: 0.9019607843, blue: 0.9921568627, alpha: 1), buttonType: CallingCodesButton.self)
        
        setUI()
    }
    
    private func setUI() {
        addBackButton()
        colorViews.forEach { $0.layer.cornerRadius = $0.frame.height / 2 }
    }
    
    private func setValue(allResult: [String], stack: UIStackView, color: UIColor, buttonType: UIButton.Type) {
        let allResultButton = buttonType.init()
        setupButton(allResultButton)
        
        var width: CGFloat = allResultButton.intrinsicContentSize.width + SizeConstants.spacing
        configureStack(stack)
        
        let label = PaddingLabel(EdgeInsetsConstants.labelEdgeInsetsForShowAllScreen)

        for i in allResult {
            configureLabel(label: label, text: i, color: color)
            width += label.intrinsicContentSize.width + SizeConstants.spacing
            switch width < stack.frame.width {
            case true:
                stack.addArrangedSubview(label)
            case false:
                stack.addArrangedSubview(allResultButton)
                addSpasingView(to: stack)
                return
            }
        }
        addSpasingView(to: stack)
      
    }
    
    private func setupButton(_ button: UIButton) {
        button.contentEdgeInsets = EdgeInsetsConstants.buttonEdgeInsets
        button.layer.cornerRadius = SizeConstants.cornerRadius
        let origImage = UIImage(named: NameConstants.dotsImage)
        let tintedImage = origImage?.withRenderingMode(.alwaysTemplate)
        button.setImage(tintedImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = EdgeInsetsConstants.buttonImageEdgeInsets
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(showAll(sender:)), for: .touchUpInside)
    }
    
    @objc private func showAll(sender: UIButton) {
        let viewController = DependecyInjectionManager.shared.assembler.resolver.resolve(ShowAllViewController.self)!
        switch sender {
        case is CurrenciesButton:
            viewController.viewModel = ShowAllViewModel(list: viewModel.currencies, color: .yellow)
            openViewController(viewController)
            
        case is LanguagesButton:
            
            viewController.viewModel = ShowAllViewModel(list: viewModel.languages, color: .orange)
            openViewController(viewController)
            
        case is TimeZonesButton:
            viewController.viewModel = ShowAllViewModel(list: viewModel.timeZones, color: .green)
            openViewController(viewController)
            
        case is CallingCodesButton:
            viewController.viewModel = ShowAllViewModel(list: viewModel.callingCodes, color: .blue)
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
        stack.spacing = SizeConstants.spacing
        stack.layoutIfNeeded()
    }
    
    private func configureLabel(label: UILabel, text: String, color: UIColor) {
        label.text = text
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = label.intrinsicContentSize.height / 2
        
    }
    
    private func addBackButton() {
        let btnLeftMenu: UIButton = UIButton()
        let image = UIImage(named: NameConstants.backImage)
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
