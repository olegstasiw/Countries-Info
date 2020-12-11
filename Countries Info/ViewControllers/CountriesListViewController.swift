//
//  CountriesListViewController.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import UIKit
import Combine

class CountriesListViewController: UIViewController {
    
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var topView: UIView!
    
    var viewModel: CountriesListViewModelProtocol!
    var subscription = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        appointDelegates()
        registerCell()
        setUI()
        configureObservers()
    }
    
    private func setUI() {
        navigationController?.navigationBar.topItem?.title = "Counries list"
        navigationController?.navigationBar.barTintColor = UIColor(red:214/255, green: 194/255, blue: 141/255, alpha: 1)
        let attrs = [
            NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 24)!
        ]

        navigationController?.navigationBar.titleTextAttributes = attrs
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        setShadow()
    }
    
    private func appointDelegates() {
        countriesCollectionView.delegate = self
        countriesCollectionView.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: "CountryViewCell", bundle: nil)
        countriesCollectionView?.register(nib, forCellWithReuseIdentifier: "CountryViewCell")
    }
    
    private func configureObservers() {
        viewModel?.countriesPublisher.sink { _ in
            DispatchQueue.main.async {
                self.countriesCollectionView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
        .store(in: &subscription)
    }
    
    private func setShadow() {
        topView.layer.borderColor = UIColor.lightGray.cgColor
        topView.layer.backgroundColor = UIColor.white.cgColor
        topView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        topView.layer.shadowOpacity = 0.1
        topView.layer.masksToBounds = false
    }
    
}

extension CountriesListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = countriesCollectionView.dequeueReusableCell(withReuseIdentifier: "CountryViewCell", for: indexPath) as! CountryViewCell
        let celViewModel = viewModel.cellViewModel(indexPath: indexPath)
        cell.viewModel = celViewModel
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let datailVC = DependecyInjectionManager.shared.assembler.resolver.resolve(CountryDetailsViewController.self)!
        datailVC.viewModel = CountryDetailsViewModel(country: viewModel.countries[indexPath.row])
        navigationController?.pushViewController(datailVC, animated: true)
    }
    
}

extension CountriesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = Constants.sectionInsets.left * (Constants.itemPerRow + 1)
        let availableWidth = countriesCollectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / Constants.itemPerRow
        return CGSize(width: widthPerItem, height: Constants.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Constants.sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.sectionInsets.bottom
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.sectionInsets.left
    }
}
