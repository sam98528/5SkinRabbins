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
    // 가격 표기 변경 함수
    func formattedPrice() -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: price)) ?? ""
        }
}

extension IceCream {
    static var iceCream : [IceCream] = [
        IceCream(koreanName: "싱글 콘", englishName: "Single Corn", choice: 1, flavor: [], price: 4700, image: UIImage(named: "singleCorn")!),
        IceCream(koreanName: "싱글 컵", englishName: "Single Cup", choice: 1, flavor: [], price: 4700, image: UIImage(named: "singleCup")!),
        IceCream(koreanName: "더블 콘", englishName: "Double Corn", choice: 2, flavor: [], price: 7300, image: UIImage(named: "doubleCorn")!),
        IceCream(koreanName: "파인트", englishName: "Pint", choice: 3, flavor: [], price: 9800, image: UIImage(named: "pint")!),
        IceCream(koreanName: "쿼터", englishName: "Quarter", choice: 4, flavor: [], price: 18500, image: UIImage(named: "quarter")!),
        IceCream(koreanName: "패밀리", englishName: "Family", choice: 5, flavor: [], price: 26000, image: UIImage(named: "family")!),
        IceCream(koreanName: "하프 갤런", englishName: "Half-Gallon", choice: 6, flavor: [], price: 31500, image: UIImage(named: "halfGallon")!),
    
    ]
}
