import Foundation
import UIKit


struct IceCream {
    // 아이스크림 한국이름 (파인트, 패밀리, 더블 등등)
    var koreanName: String
    // 아이스크림 영어이름 (파인트, 패밀리, 더블 등등)
    var EnglishName: String
    // 아이스크림 선택 가능 수
    var choice : Int
    // 맛 저장용
    var flavor : [Flavor]
    // 가격
    var price : Int
    // 이미지
    var image : UIImage
}

extension IceCream {
    static var iceCream : [IceCream] = [
        IceCream(koreanName: "파인트", EnglishName: "TEST", choice: 2, flavor: [], price: 1234, image: UIImage(named: "31 Yogurt")!),
        IceCream(koreanName: "파인트", EnglishName: "TEST", choice: 2, flavor: [], price: 1234, image: UIImage(named: "31 Yogurt")!),
        IceCream(koreanName: "파인트", EnglishName: "TEST", choice: 2, flavor: [], price: 1234, image: UIImage(named: "31 Yogurt")!),
        IceCream(koreanName: "파인트", EnglishName: "TEST", choice: 2, flavor: [], price: 1234, image: UIImage(named: "31 Yogurt")!),
    
    ]
}
