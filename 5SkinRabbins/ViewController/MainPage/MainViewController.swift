import Foundation
import UIKit


class MainViewController: UIViewController {
    
   
    @IBOutlet weak var IceCreamCakeView: UIView!
    @IBOutlet weak var IceCreamCakeImage: UIImageView!
    @IBOutlet weak var CoffeeView: UIView!
    @IBOutlet weak var CoffeeImage: UIImageView!
    @IBOutlet weak var BeverageView: UIView!
    @IBOutlet weak var BeverageImage: UIImageView!
    @IBOutlet weak var QuartView: UIView!
    @IBOutlet weak var QuartImage: UIImageView!
    
    
    
    @IBOutlet weak var IceCreamCake: UILabel!
    @IBOutlet weak var IceCreamCakeLabel: UILabel!
    @IBOutlet weak var Coffee: UILabel!
    @IBOutlet weak var CoffeeLabel: UILabel!
    @IBOutlet weak var Beverage: UILabel!
    @IBOutlet weak var BeverageLabel: UILabel!
    @IBOutlet weak var Quart: UILabel!
    @IBOutlet weak var QuartLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        IceCreamCakeImage.image = UIImage(named: "Cake")
        CoffeeImage.image = UIImage(named: "Coffee")
        BeverageImage.image = UIImage(named: "Beverage")
        QuartImage.image = UIImage(named: "Quart")
        IceCreamCakeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        CoffeeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        BeverageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        QuartLabel.font = UIFont.boldSystemFont(ofSize: 20)

        
        let IceCreamCakeRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(IceCreamCakefucn(_:)))
        let CoffeeViewRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Coffeefunc(_:)))
        let BeverageViewRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Beveragefunc(_:)))
        let QuartViewRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Quartfunc(_:)))
        IceCreamCakeView.addGestureRecognizer(IceCreamCakeRecognizer)
        CoffeeView.addGestureRecognizer(CoffeeViewRecognizer)
        BeverageView.addGestureRecognizer(BeverageViewRecognizer)
        QuartView.addGestureRecognizer(QuartViewRecognizer)
    }
}

extension MainViewController {
    
    @objc func IceCreamCakefucn(_ gesture: UITapGestureRecognizer) {
        let storyboard: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @objc func Coffeefunc(_ gesture: UITapGestureRecognizer) {
        let storyboard2: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard2.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @objc func Beveragefunc(_ gesture: UITapGestureRecognizer) {
        let storyboard3: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard3.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    
    @objc func Quartfunc(_ gesture: UITapGestureRecognizer) {
        let storyboard4: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard4.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}
    


