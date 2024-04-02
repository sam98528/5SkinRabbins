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

extension Coffee {
  static var coffee: [Coffee] = [
    Coffee(koreanName: "아포가토 라떼 ICED", englishName: "Affogato Latte(ICED)", price: 4500, image: UIImage(named: "Affogato Latte")! ),
    Coffee(koreanName: "아메리카노 ICED", englishName: "Americano Iced", price: 2800, image: UIImage(named: "Americano Iced")! ),
    Coffee(koreanName: "디카페인 아메리카노 HOT", englishName: "Americano Large(HOT)(DECAF)", price: 4500, image: UIImage(named: "Americano Large(HOT)(DECAF)")! ),
    // 추가중
  ]
}
