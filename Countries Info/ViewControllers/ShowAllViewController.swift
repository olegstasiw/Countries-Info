//
//  ShowAllViewController.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 11.12.2020.
//

import UIKit

class ShowAllViewController: UIViewController {
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var listStack: UIStackView!
    @IBOutlet weak var contenViewHeightConstraint: NSLayoutConstraint!
    
    var viewModel: ShowAllViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBlur()
        setupStack()
        
        setUI()
    }
    
    private func setUI() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
        contentView.layer.cornerRadius = SizeConstants.cornerRadius
        makeBackgroundColor(color: viewModel.color, in: closeButton)
    }
    
    private func makeBackgroundColor(color: NewColor, in button: UIButton) {
        let color = UIColor(red: color.color.red,
                            green: color.color.green,
                            blue: color.color.blue,
                            alpha: 1)
        button.backgroundColor = color
    }
    private func makeBlur() {
        let blurFx = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurFxView = UIVisualEffectView(effect: blurFx)
        blurFxView.frame = view.bounds
        blurFxView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurFxView, at: 0)
    }
    
    private func configureStack(_ stack: UIStackView) {
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = SizeConstants.spacing
        stack.layoutIfNeeded()
    }
    
    private func setupStack() {
        configureStack(listStack)
        var height: CGFloat = closeButton.intrinsicContentSize.height + SizeConstants.height
        for text in viewModel.list {
            let label = PaddingLabel(EdgeInsetsConstants.labelEdgeInsetsForShowAllScreen)
            configureLabel(label: label, text: text, colorType: viewModel.color)
            
            height += label.intrinsicContentSize.height + SizeConstants.spacing
            listStack.addArrangedSubview(label)
        }
        contenViewHeightConstraint.constant = height
        
    }
    
    private func configureLabel(label: UILabel, text: String, colorType: NewColor) {
        label.text = text
        let color = UIColor(red: colorType.color.red,
                            green: colorType.color.green,
                            blue: colorType.color.blue,
                            alpha: 1)
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = label.intrinsicContentSize.height / 2
    }
    
    @IBAction func closeButtonPress() {
        dismiss(animated: true)
    }
}
