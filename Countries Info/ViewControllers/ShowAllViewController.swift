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
        
        closeButton.layer.cornerRadius = Constants.cornerRadius
        contentView.layer.cornerRadius = Constants.cornerRadius
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
        stack.spacing = Constants.spacing
        stack.layoutIfNeeded()
    }
    
    private func setupStack() {
        configureStack(listStack)
        var height: CGFloat = closeButton.intrinsicContentSize.height + Constants.height
        for text in viewModel.list {
            let label = PaddingLabel(withInsets: 5, 5, 20, 20)
            configureLabel(label: label, text: text, color: viewModel.color)
            
            height += label.intrinsicContentSize.height + Constants.spacing
            listStack.addArrangedSubview(label)
        }
        contenViewHeightConstraint.constant = height
    }
    
    private func configureLabel(label: UILabel, text: String, color: UIColor) {
        label.text = text
        label.backgroundColor = color
        label.layer.masksToBounds = true
        label.layer.cornerRadius = Constants.cornerRadius
    }
    
    @IBAction func closeBunntonPress() {
        dismiss(animated: true)
    }
}
