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
    
    //LINESeedSansKR-Regular
    //LINESeedSansKR-Thin
    //LINESeedSansKR-Bold
    //YANGJIN
    // 폰트 설정
    let lineFontB = UIFont(name: "LINESeedSansKR-Bold", size: 22.0)
    let lineFontR = UIFont(name: "LINESeedSansKR-Regular", size: 12.0)
    
     override func awakeFromNib() {
         super.awakeFromNib()
         
         // 셀 내 레이블에 폰트 일괄 적용
         productNameLabel.font = lineFontB
         productNameLabel.textColor = UIColor(hex: 0x222222)
         englishNameLabel.font = lineFontR
         productPriceLabel.font = lineFontB
         productPriceLabel.textColor = UIColor(hex: 0x222222)
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
