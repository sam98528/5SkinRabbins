
import UIKit

class PaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var things: [Any] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        
        if let thing = things[indexPath.row] as? IceCream {
            // ice cream
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            
            var flavorText = ""
            for flavor in thing.flavor {
                flavorText += "\(flavor.name), "
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
                        Flavor(name: "바닐라", image: UIImage(named: "Vanilla IceCream")!),
                        Flavor(name: "월넛", image: UIImage(named:"Walnut IceCream")!)],
                     price: 452,
                     image: UIImage(named: "Vanilla IceCream")!,
                     isCorn: true))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "paymentCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "paymentCell")
        
        tableView.reloadData()
    }

}
