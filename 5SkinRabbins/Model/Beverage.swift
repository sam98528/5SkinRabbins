//
//  Beverage.swift
//  5SkinRabbins
//
//  Created by Sam.Lee on 4/1/24.
//

import Foundation
import UIKit

//음료
struct Beverage {
    // 커피 종류 한국어
    var koreanName: String
    // 커피 종류 영어
    var englishName: String
    // 가격
    var price : Int
    // 이미지
    var image : UIImage
    
}

extension Beverage {
    static var beverage: [Beverage] = [
        Beverage(koreanName: "체리 워터 블라스트", englishName: "Cherry Water Blast", price: 4800, image: UIImage(named: "Cherry Water Blast")! ),
        Beverage(koreanName: "바삭바삭 누룽지쉐이크", englishName: "Crispy Rice Crunchy Shake", price: 6500, image: UIImage(named: "Crispy Rice Crunchy Shake")! ),
        Beverage(koreanName: "자몽 블랙티 블라스트", englishName: "Grapefruit Black Tea Blast", price: 4800, image: UIImage(named: "Grapefruit Black Tea Blast")! ),
        Beverage(koreanName: "레몬라임 민트티 블라스트", englishName: "Lemon Lime Mint Tea Blast", price: 4800, image: UIImage(named: "Lemon Lime Mint Tea Blast")! ),
        Beverage(koreanName: "리치베리아이스티", englishName: "Lychee Berry Iced Tea", price: 3500, image: UIImage(named: "Lychee Berry Iced Tea")! ),
        Beverage(koreanName: "밀크 쉐이크", englishName: "Milk Shake", price: 5800, image: UIImage(named: "Milk Shake")! ),
        Beverage(koreanName: "복숭아 아이스티", englishName: "PEACH ICED TEA", price: 2000, image: UIImage(named: "PEACH ICED TEA")! ),
        // 추가 완료
    ]
}

