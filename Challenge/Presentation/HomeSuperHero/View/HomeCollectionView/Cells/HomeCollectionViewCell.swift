//
//  SuperHeroCollectionViewCell.swift
//  Challenge
//
//  Created by Everis on 23/08/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var superHeroImageView: UIImageView!
    @IBOutlet weak var superHeroName: UILabel!
    @IBOutlet weak var superHeroHeight: UILabel!
    @IBOutlet weak var superHeroWeight: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
