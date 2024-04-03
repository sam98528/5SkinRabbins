
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
        
        if let thing = things[indexPath.row] as? IceCream {
            // ice cream
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            
            var flavorText = ""
            for (index, flavor) in thing.flavor.enumerated() {
                flavorText += flavor.name
                if index < thing.flavor.count - 1 {
                    flavorText += ", "
                }
            }
            cell.payDetailLabel.text = flavorText
            
            if let firstFlavorImage = thing.flavor.first?.image {
                cell.payImageView.image = firstFlavorImage
            } else {
                cell.payImageView.image = nil
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
