//
//  ProductCollectionViewCell.swift
//  5SkinRabbins
//
//  Created by Jeong-bok Lee on 4/2/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
   
    // 셀 식별자
    static let identifier = "ProductCollectionViewCell"
    
    // 셀을 가져오기 위한 Nib
    static func nib() -> UINib {
        return UINib(nibName: "ProductCollectionViewCell", bundle: nil)
    }
    
    // IBOutlet 연결
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var englishNameLabel: UILabel!
    
    /* 폰트명
    OAGothic-ExtraBold
    LINESeedSansKR-Regular
    LINESeedSansKR-Thin
    LINESeedSansKR-Bold
    */
    
     override func awakeFromNib() {
         super.awakeFromNib()
         
         // 셀 내 레이블에 폰트 일괄 적용
         productNameLabel.font = UIFont(name: "LINESeedSansKR-Bold", size: 22)
         productNameLabel.textColor = UIColor(red: 0.086, green: 0.086, blue: 0.086, alpha: 1)
             
         englishNameLabel.font = UIFont(name: "LINESeedSansKR-Regular", size: 12)
         englishNameLabel.textColor = UIColor(red: 0.086, green: 0.086, blue: 0.086, alpha: 0.86)
             
             
         productPriceLabel.font = UIFont(name: "LINESeedSansKR-Bold", size: 20)
         productPriceLabel.textColor = UIColor(red: 0.086, green: 0.086, blue: 0.086, alpha: 1)
     }
    
    // IceCream 셀 설정
    func configure(with product: IceCream) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.formattedPrice()) 원"
    }
    
    // Cake 셀 설정
    func configure(with product: Cake) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.formattedPrice()) 원"
    }
    
    // Beverage 셀 설정
    func configure(with product: Beverage) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.formattedPrice()) 원"
    }
    
    // Coffee 셀 설정
    func configure(with product: Coffee) {
        productImageView.image = product.image
        productNameLabel.text = product.koreanName
        englishNameLabel.text = product.englishName
        productPriceLabel.text = "\(product.formattedPrice()) 원"
    }
}
