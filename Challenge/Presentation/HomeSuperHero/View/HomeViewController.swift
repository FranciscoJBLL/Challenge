//
//  ViewController.swift
//  Challenge
//
//  Created by Everis on 23/08/21.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bind()
    }
    
    func setupViews() {
        title = Constants.Localized.titleHome
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nibCell = UINib(nibName: Constants.XibName.homeCellView, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: Constants.CellIdentifier.homeCell)
        
        viewModel.fetchSuperHeroData()
    }
    
    func bind() {
        viewModel.updateData = { [weak self] () in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.superHeroList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.CellIdentifier.homeCell, for: indexPath) as! HomeCollectionViewCell
        
        let superHero = viewModel.superHeroList[indexPath.row]
    
        let url = URL(string: superHero.images.md)
        cell.superHeroImageView.af.setImage(withURL: url!)
        cell.superHeroName.text = superHero.name
        cell.superHeroHeight.text = "\(Constants.Localized.height) \(superHero.appearance.height[1])"
        cell.superHeroWeight.text = "\(Constants.Localized.Weight) \(superHero.appearance.weight[1])"
        cell.shadowDecorate()
        
        return cell
        
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bound = collectionView.bounds
        return CGSize(width: bound.width / 2 - 25, height: bound.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
