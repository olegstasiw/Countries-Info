//
//  CountriesListViewController.swift
//  Countries Info
//
//  Created by Oleh Stasiv on 02.12.2020.
//

import UIKit

class CountriesListViewController: UIViewController {
    
    @IBOutlet weak var countriesCollectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var topView: UIView!
    
    var viewModel: CountriesListViewModelProtocol! {
        didSet {
            viewModel.fetchResult {
                DispatchQueue.main.async {
                    self.countriesCollectionView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    private let itemPerRow: CGFloat = 1
    private let sectionInserts = UIEdgeInsets(top: 20, left: 13, bottom: 20, right: 13)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appointDelegates()
        registerCell()
   
        setUI()
    }
    
    private func setUI() {
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
    
}

extension CountriesListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = sectionInserts.left * (itemPerRow + 1)
        let availableWidth = countriesCollectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemPerRow
        return CGSize(width: widthPerItem, height: 174)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInserts
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.bottom
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInserts.left
    }
}
