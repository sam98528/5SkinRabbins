import Foundation
import UIKit

struct Cake {
    // 커피 종류 한국어
    var koreanName: String
    // 커피 종류 영어
    var englishName: String
    // 가격
    var price : Int
    // 이미지
    var image : UIImage
}
extension Cake {
    static var cake: [Cake] = [
        Cake(koreanName: "한송이 가득 도쿄바나나", englishName: "A Bunch of Tokyo Banana", price: 29000, image: UIImage(named: "A Bunch of Tokyo Banana")! ),
        Cake(koreanName: "올 어바웃 초코", englishName: "All About Chocolate", price: 24000, image: UIImage(named: "All About Chocolate")! ),
        Cake(koreanName: "플라워 브리즈", englishName: "Flower Breeze Cake", price: 25000, image: UIImage(named: "Flower Breeze Cake")! ),
        Cake(koreanName: "해피 조이 큐브", englishName: "Happy Joy Cube", price: 26000, image: UIImage(named: "Happy Joy Cube")! ),
        Cake(koreanName: "허그미 화이트 퍼피", englishName: "Hug Me White Puppy", price: 28000, image: UIImage(named: "Hug Me White Puppy")! ),
        Cake(koreanName: "러블리 화이트 베어", englishName: "Lovely White Bear", price: 32000, image: UIImage(named: "Lovely White Bear")! ),
        Cake(koreanName: "하트 쏙 ~ 샌드 케이크", englishName: "Sand Cake With Love", price: 28000, image: UIImage(named: "Sand Cake With Love")! ),
        Cake(koreanName: "반짝이는 잔망루피", englishName: "Shining Zanmang Loopy", price: 30000, image: UIImage(named: "Shining Zanmang Loopy")! ),
        Cake(koreanName: "달콤한 구름이 퐁당퐁당", englishName: "Sweet Clouds Pong Dang", price: 26000, image: UIImage(named: "Sweet Clouds Pong Dang")! ),
        Cake(koreanName: "땡큐 케이크", englishName: "Thank You Cake", price: 27000, image: UIImage(named: "Thank You Cake")! ),
        Cake(koreanName: "나눠먹는 큐브 와츄원", englishName: "What You Want Cube To Share", price: 34000, image: UIImage(named: "What You Want Cube To Share")! ),
        // 추가 완료
    ]
}
