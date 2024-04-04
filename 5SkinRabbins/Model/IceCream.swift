import Foundation
import UIKit


struct IceCream {
    // 아이스크림 한국이름 (파인트, 패밀리, 더블 등등)
    var koreanName: String
    // 아이스크림 영어이름 (파인트, 패밀리, 더블 등등)
    var englishName: String
    // 아이스크림 선택 가능 수
    var choice : Int
    // 맛 저장용
    var flavor : [Flavor]
    // 가격
    var price : Int
    // 이미지
    var image : UIImage
    // 콘인지 컵인지
    // 1 이면 콘 ,0 이면 컵
    var isCorn : Bool
}

extension IceCream {
    /*
    static var data : [IceCream] = [
        IceCream(name: "싱글 컵", choice: 1, flavor: [], price: 4700, image: UIImage(), isCorn: true)
    
    ]
    */
}
