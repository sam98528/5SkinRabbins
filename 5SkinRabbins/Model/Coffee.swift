import Foundation
import UIKit


struct Coffee {
    // 커피 종류 한국어
    var koreanName: String
    // 커피 종류 영어
    var englishName: String
    // 가격
    var price : Int
    // 이미지
    var image : UIImage
}
        Coffee(koreanName: "아메리카노 ICED", englishName: "Americano Iced", price: 2800, image: UIImage(named: "Americano Iced")! ),
        Coffee(koreanName: "디카페인 아메리카노 HOT", englishName: "Americano Large(HOT)(DECAF)", price: 4500, image: UIImage(named: "Americano Large(HOT)(DECAF)")! ),
        Coffee(koreanName: "카페라떼 ICED", englishName: "Cafe Latte Iced", price: 3000, image: UIImage(named: "Cafe Latte Iced")! ),
        Coffee(koreanName: "콜드브루 라떼", englishName: "Cold Brew Latte", price: 4300, image: UIImage(named: "Cold Brew Latte")! ),
        Coffee(koreanName: "연유라떼 HOT", englishName: "Condensed Milk Latte Hot", price: 3500, image: UIImage(named: "Condensed Milk Latte Hot")! ),
        Coffee(koreanName: "디카페인 카페라떼 ICED", englishName: "Cafe Latte(ICED)(DECAF)", price: 3300, image: UIImage(named: "iceDecaffeinatedLatte")! ),
