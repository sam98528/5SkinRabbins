
import UIKit

class PaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var things: [Any] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        cell.payNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        cell.payPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        cell.plusButton.tintColor = .black
        cell.minusButton.tintColor = .gray
        
        //셀 삭제
        cell.deleteButtonAction = { [weak self] in
            self?.deleteThing(at: indexPath) // 셀 삭제 메서드 호출
        }
        
        if let iceCream = things[indexPath.row] as? IceCream {
            cell.thingPrice = iceCream.price // thingPrice 값을 iceCream.price로 설정
        } else if let coffee = things[indexPath.row] as? Coffee {
            cell.thingPrice = coffee.price // thingPrice 값을 coffee.price로 설정
        } else if let cake = things[indexPath.row] as? Cake {
            cell.thingPrice = cake.price // thingPrice 값을 cake.price로 설정
        } else if let beverage = things[indexPath.row] as? Beverage {
            cell.thingPrice = beverage.price // thingPrice 값을 beverage.price로 설정
        }
        
        // ice cream
        if let thing = things[indexPath.row] as? IceCream {
            // 이름
            cell.payNameLabel.text = thing.koreanName
            // 가격
            cell.payPriceLabel.text = "\(thing.price)원"
            // 선택한 맛
            var flavorText = ""
            for (index, flavor) in thing.flavor.enumerated() {
                flavorText += flavor.name
                if index < thing.flavor.count - 1 {
                    flavorText += ", "
                }
            }
            cell.payDetailLabel.text = flavorText
            //이미지 (일단은 고른 맛에 첫번째 이미지로..)
            if let firstFlavorImage = thing.flavor.first?.image {
                cell.payImageView.image = firstFlavorImage
            } else {
                cell.payImageView.image = nil
            }
            //버튼
            cell.minusButtonAction = {
                if cell.cnt > 1 { cell.cnt -= 1 }
            }
            cell.plusButtonAction = {
                cell.cnt += 1
            }
            
        } else if let thing = things[indexPath.row] as? Coffee {
            // coffee
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = nil
        } else if let thing = things[indexPath.row] as? Cake {
            // cake
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = nil
        } else if let thing = things[indexPath.row] as? Beverage {
            //beverage
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //셀 삭제 메서드
    private func deleteThing(at indexPath: IndexPath) {
        things.remove(at: indexPath.row) // 데이터 배열에서 해당 항목 삭제
        tableView.deleteRows(at: [indexPath], with: .left) // 테이블 뷰에서 해당 셀 삭제
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        things.append(
            IceCream(koreanName: "파인트",
                     EnglishName: "pint",
                     choice: 3,
                     flavor: [
                        Flavor(name: "바닐라", image: UIImage(named: "Vanilla")!),
                        Flavor(name: "월넛", image: UIImage(named:"Walnut")!)],
                     price: 452,
                     image: UIImage(named: "Vanilla")!,
                     isCorn: true))
        
        things.append(
            IceCream(koreanName: "패밀리",
                     EnglishName: "family",
                     choice: 4,
                     flavor: [
                        Flavor(name: "망고 탱고", image: UIImage(named: "Mango Tango")!),
                        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named:"New York CheeseCake")!)],
                     price: 452,
                     image: UIImage(named: "New York CheeseCake")!,
                     isCorn: true))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "PaymentTableViewCell", bundle: Bundle(for: type(of: self)))
        
        tableView.register(nibName, forCellReuseIdentifier: "paymentCell")
        
        tableView.reloadData()
    }

}
