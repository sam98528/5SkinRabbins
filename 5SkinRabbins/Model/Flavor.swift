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
        Flavor(name: "아이스 도코바나나", image: UIImage(named: "Ice Tokyo banana")! ),
        Flavor(name: "팥있는 말차당", image: UIImage(named: "Matcha & Red Bean Ice Cream")!),
        Flavor(name: "봉쥬르, 마카롱", image:UIImage(named: "Bonjour, Macaron")!),
        Flavor(name: "피치 요거트", image:UIImage(named: "Peach Yogurt")! ),
        Flavor(name: "민트 초코 봉봉", image:UIImage(named: "Mint Chocolate BonBon")!  ),
        Flavor(name: "망고 탱고", image:UIImage(named: "Mango Tango")! ),
        Flavor(name: "러브미", image: UIImage(named: "Loves Me")!),
        Flavor(name: "아빠는 딸바봉", image: UIImage(named: "Papa & Daughter Ice Cream")!),
        Flavor(name: "엄마는 외계인", image: UIImage(named: "Puss In Boots")!),
        Flavor(name: "민트 초콜릿 칩", image: UIImage(named: "Mint Chocolate Chip")!),
        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named: "New York CheeseCake")!),
        Flavor(name: "레인보우 샤베트", image: UIImage(named: "Rainbow Sherbet")!),
        Flavor(name: "체리쥬빌레", image: UIImage(named: "Cherries Jubilee")!),
        Flavor(name: "슈팅스타", image: UIImage(named: "Shooting Star")!),
        Flavor(name: "사랑에 빠진 딸기", image: UIImage(named: "Love Struck Strawberry")!),
        Flavor(name: "오레오 쿠키 앤 크림", image: UIImage(named: "Oreo Cookie´s n Cream")!),
        Flavor(name: "베리베리 스트로베리", image: UIImage(named: "Very Berry Strawberry")!),
        Flavor(name: "31요거트", image: UIImage(named: "Rainbow Sherbet")!),
        Flavor(name: "바람과 함께 사라지다", image: UIImage(named: "Twinberry CheeseCake")!),
        Flavor(name: "바닐라", image: UIImage(named: "Vanilla")!),
        Flavor(name: "이상한 나라의 솜사탕", image: UIImage(named: "Cotton Candy Wonderland")!),
        Flavor(name: "초콜릿 무스", image: UIImage(named: "Chocolate Mousse")!),
        Flavor(name: "그린티", image: UIImage(named: "Green Tea")!),
        Flavor(name: "피스타치오 아몬드", image: UIImage(named: "Pistachio Almond")!),
        Flavor(name: "월넛", image: UIImage(named: "Walnut")!),
        Flavor(name: "자모카 아몬드 훠지", image: UIImage(named: "Jamoca Almond Fudge")!),
        Flavor(name: "아몬드 봉봉", image: UIImage(named: "Almond Bon Bon")!),
    ]
}
