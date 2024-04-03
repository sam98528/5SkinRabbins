//
//  ProductCollectionViewCell.swift
//  5SkinRabbins
//
//  Created by Jeong-bok Lee on 4/2/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "ProductCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var englishNameLabel: UILabel!
    
    func configure(with product: IceCream) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.price)원"
    }
    func configure(with product: Cake) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.price)원"
    }
    func configure(with product: Beverage) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.price)원"
    }
    func configure(with product: Coffee) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.price)원"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
