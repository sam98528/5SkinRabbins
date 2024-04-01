//
//  DetailsCollectionViewCell.swift
//  5SkinRabbins
//
//  Created by Sam.Lee on 4/1/24.
//

import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var flavorImageView: UIImageView!
    @IBOutlet weak var flavorNameLabel: UILabel!
    
    static let identifier = "DetailsCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DetailsCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
