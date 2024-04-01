import Foundation
import UIKit


struct Flavor{
    // 아이스크림 맛 종류
    var name : String
    // 아이스크림 이미지
    var image : UIImage
}

extension Flavor {
    static var flavors: [Flavor] = [
        Flavor(name: "아이스 도코바나나", image: UIImage(named: "아이스도쿄바나나")! ),
        Flavor(name: "팥있는 말차당", image: UIImage(named: "팥있는말차당")!),
        Flavor(name: "봉쥬르, 마카롱", image:UIImage(named: "봉쥬르마카롱")!),
        Flavor(name: "피치 요거트", image:UIImage(named: "피치요거트")! ),
        Flavor(name: "민트 초코 봉봉", image:UIImage(named: "민트초코봉봉")!  ),
        Flavor(name: "망고 탱고", image:UIImage(named: "망고탱고")! ),
        Flavor(name: "러브미", image: UIImage(named: "러브미")!),
        Flavor(name: "아빠는 딸바봉", image: UIImage(named: "아빠는딸바봉")!),
        Flavor(name: "엄마는 외계인", image: UIImage(named: "엄마는외계인")!),
        Flavor(name: "민트 초콜릿 칩", image: UIImage(named: "민트초콜릿칩")!),
        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named: "뉴욕치크케이크")!),
        Flavor(name: "레인보우 샤베트", image: UIImage(named: "레인보우샤베트")!),
    ]
}
