import Foundation
import UIKit


class MainViewController: UIViewController {
    
        
    //이미지랑 View종류
    @IBOutlet weak var IceCreamCakeImage: UIImageView!
    @IBOutlet weak var CoffeeImage: UIImageView!
    @IBOutlet weak var BeverageImage: UIImageView!
    @IBOutlet weak var QuartImage: UIImageView!
    //라벨종류
    @IBOutlet weak var IceCreamCake: UILabel!
    @IBOutlet weak var IceCreamCakeLabel: UILabel!
    @IBOutlet weak var Coffee: UILabel!
    @IBOutlet weak var CoffeeLabel: UILabel!
    @IBOutlet weak var Beverage: UILabel!
    @IBOutlet weak var BeverageLabel: UILabel!
    @IBOutlet weak var Quart: UILabel!
    @IBOutlet weak var QuartLabel: UILabel!
    
    //컬렉션뷰
    @IBOutlet weak var MainPageCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MainPageCollectionView.delegate = self
        self.MainPageCollectionView.dataSource = self
        bannerTime()
        
        IceCreamCakeImage.image = UIImage(named: "Cake1")
        CoffeeImage.image = UIImage(named: "Coffee")
        BeverageImage.image = UIImage(named: "Beverage")
        QuartImage.image = UIImage(named: "Quart")
        IceCreamCakeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        CoffeeLabel.font = UIFont.boldSystemFont(ofSize: 20)
        BeverageLabel.font = UIFont.boldSystemFont(ofSize: 20)
        QuartLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        //이미지누르면 이동하게 하는거
        let IceCreamCakeRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(IceCreamCakefucn(_:)))
        let CoffeeRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Coffeefunc(_:)))
        let BeverageRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Beveragefunc(_:)))
        let QuartRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(Quartfunc(_:)))
        IceCreamCakeImage.isUserInteractionEnabled = true
        IceCreamCakeImage.addGestureRecognizer(IceCreamCakeRecognizer)
        CoffeeImage.isUserInteractionEnabled = true
        CoffeeImage.addGestureRecognizer(CoffeeRecognizer)
        BeverageImage.isUserInteractionEnabled = true
        BeverageImage.addGestureRecognizer(BeverageRecognizer)
        QuartImage.isUserInteractionEnabled = true
        QuartImage.addGestureRecognizer(QuartRecognizer)
    }
}
//배너이미지 배열부분
var nowPage: Int = 0
let bannerArray: Array<UIImage> = [UIImage(named: "Banner1")!, UIImage(named: "Banner2")!, UIImage(named: "Banner3")!, UIImage(named: "Banner4")!, UIImage(named: "Banner5")!]



//다른스토리보드로 넘어가는것 연결한 부분
extension MainViewController {		
    
    //케이크페이지로 넘어가는부분
    @objc func IceCreamCakefucn(_ gesture: UITapGestureRecognizer) {
        let storyboard: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    //커피페이지로 넘어가는부분
    @objc func Coffeefunc(_ gesture: UITapGestureRecognizer) {
        let storyboard2: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard2.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    //음료페이지로 넘어가는부분
    @objc func Beveragefunc(_ gesture: UITapGestureRecognizer) {
        let storyboard3: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard3.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
    //아이스크림으로 넘어가는부분
    @objc func Quartfunc(_ gesture: UITapGestureRecognizer) {
        let storyboard4: UIStoryboard = UIStoryboard(name: "testStoryboard", bundle: nil)
        let viewcontroller = storyboard4.instantiateViewController(withIdentifier: "testStoryboard")
        navigationController?.pushViewController(viewcontroller, animated: true)
    }
}

//컬렉션뷰 구현부분
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MainPageCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! CollectionViewCell
        cell.ImageView.image = bannerArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
    //배너부분 돌아가는거
    func bannerTime() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { (Timer) in self.bannerMove()
        }
    }
    func bannerMove() {
        if nowPage == bannerArray.count - 1 {
            MainPageCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at:.right, animated: true)
            nowPage = 0
            return
        }
        nowPage += 1
        MainPageCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at:.right, animated: true)
    }
    
}
