//
//  DetailsViewController.swift
//  5SkinRabbins
//
//  Created by Sam.Lee on 4/1/24.
//

import UIKit

protocol FlavorDelegate {
    func finishedFlavorEditing(iceCream : IceCream)
    
}


class DetailsViewController: UIViewController  {
    let titleFont = "YANGJIN"
    let labelFont = "LINESeedSansKR-Bold"
    var selectedFlavor : [Flavor] = []
    var selectedMenu : IceCream?
    
    
    var currentPage: Int = 0
    
    var delegate : FlavorDelegate?
    
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var selectedMenuButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectedFlavorCollectionView: UICollectionView!
    @IBOutlet weak var flavorCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func dismissButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func confirmButtonClicked(_ sender: Any) {
        var check = true
        for (_,element) in selectedFlavor.enumerated(){
            if element.name == "" {
                check = false
                break
            }
        }
        if !check {
            let alert = UIAlertController(title: "경고", message:
                                            "\(selectedFlavor.count)가지 맛을 채워주세요!", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "확인", style: .destructive, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }else{
            selectedMenu!.flavor = selectedFlavor
            self.delegate?.finishedFlavorEditing(iceCream: selectedMenu!)
            self.dismiss(animated: true)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureCollectionViews()
        configureEditMenu()
        configureData()
    }
    
    
}

// CollectionView
extension DetailsViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func configureCollectionViews(){
        self.selectedFlavorCollectionView.dataSource = self
        self.selectedFlavorCollectionView.delegate = self
        selectedFlavorCollectionView.register(SelectedFlavorCollectionViewCell.nib(), forCellWithReuseIdentifier: SelectedFlavorCollectionViewCell.identifier)
        
        let selectedFlowLayout = UICollectionViewFlowLayout()
        selectedFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 0, right: 30)
        selectedFlowLayout.minimumLineSpacing = 20
        selectedFlowLayout.minimumInteritemSpacing = 10
        selectedFlowLayout.scrollDirection = .horizontal
        selectedFlowLayout.itemSize = CGSize(width: Int(selectedFlavorCollectionView.frame.size.width / 6 ), height: Int(selectedFlavorCollectionView.frame.size.width / 6))
        selectedFlavorCollectionView.collectionViewLayout = selectedFlowLayout
        
        self.flavorCollectionView.dataSource = self
        self.flavorCollectionView.delegate = self
        flavorCollectionView.register(FlavorCollectionViewCell.nib(), forCellWithReuseIdentifier: FlavorCollectionViewCell.identifier)
        
        let flavorFlowLayout = UICollectionViewFlowLayout()
        flavorFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        flavorFlowLayout.minimumLineSpacing = 1
        flavorFlowLayout.minimumInteritemSpacing = 0
        flavorFlowLayout.scrollDirection = .horizontal
        flavorFlowLayout.itemSize = CGSize(width: Int(flavorCollectionView.frame.size.width / 3), height: Int(flavorCollectionView.frame.size.width / 3))
        flavorCollectionView.collectionViewLayout = flavorFlowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case flavorCollectionView:
            return Flavor.flavors.count
        case selectedFlavorCollectionView:
            return selectedFlavor.count
        default:
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case flavorCollectionView:
            for (index,flavor) in selectedFlavor.enumerated() {
                if flavor.image == UIImage(named: "icecream_line") {
                    selectedFlavor[index].image = Flavor.flavors[indexPath.row].image
                    selectedFlavor[index].name = Flavor.flavors[indexPath.row].name
                    selectedFlavorCollectionView.reloadItems(at: [IndexPath(row: index, section: 0)])
                    break
                }
            }
        case selectedFlavorCollectionView:
            selectedFlavor.remove(at: indexPath.row)
            selectedFlavor.append(Flavor(name: "", image: UIImage(named: "icecream_line")!))
            selectedFlavorCollectionView.reloadData()
            
        default:
            print("ERROR")
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case flavorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlavorCollectionViewCell.identifier, for: indexPath) as! FlavorCollectionViewCell
            
            cell.flavorImageView.image = Flavor.flavors[indexPath.row].image
            cell.flavorNameLabel.text = Flavor.flavors[indexPath.row].name
            cell.flavorNameLabel.font = UIFont(name: labelFont, size: 13)
            return cell
        case selectedFlavorCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectedFlavorCollectionViewCell.identifier, for: indexPath) as! SelectedFlavorCollectionViewCell
            cell.selctedFlavorImageView.image = selectedFlavor[indexPath.row].image
            cell.layer.cornerRadius = cell.layer.bounds.height / 2
            cell.selctedFlavorImageView.backgroundColor = UIColor.white
            cell.layer.borderWidth = 3
            cell.clipsToBounds = true
            cell.layer.borderColor = UIColor(red: 0.95, green: 0.82, blue: 0.82, alpha: 1.00).cgColor
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.flavorCollectionView.frame.width)
        self.pageControl.currentPage = page
    }
    
    
}

extension DetailsViewController {
    
    func configureView(){
        confirmButton.layer.cornerRadius = confirmButton.bounds.height / 2
        confirmButton.clipsToBounds = true
        confirmButton.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.05).cgColor
        confirmButton.layer.borderWidth = 2
        confirmButton.titleLabel?.font = UIFont(name: labelFont, size: 17)
        
        cancelButton.layer.cornerRadius = cancelButton.bounds.height / 2
        cancelButton.clipsToBounds = true
        cancelButton.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.05).cgColor
        cancelButton.layer.borderWidth = 2
        cancelButton.titleLabel?.font = UIFont(name: labelFont, size: 17)
        
        titleLabel.textColor = UIColor(red: 0.98, green: 0.42, blue: 0.51, alpha: 1.00)
        titleLabel.font = UIFont(name: titleFont, size: 34)
        titleLabel.text = "Flavor"
        navigationBar.shadowImage = UIImage()
        
        pageControl.numberOfPages = Int(ceil(Double(Flavor.flavors.count) / Double(9)))
        pageControl.pageIndicatorTintColor = UIColor.systemGray
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.98, green: 0.42, blue: 0.51, alpha: 1.00)
        selectedMenuButton.setImage(selectedMenu?.image, for: .normal)
    }
    
    func configureData(){
        let choice = selectedMenu?.choice ?? 0
        selectedFlavor = []
        for _ in 0..<choice{
            selectedFlavor.append(Flavor(name: "", image: UIImage(named: "icecream_line")!))
        }
    }
}

extension DetailsViewController {
    var items: [UIAction] {
        let singleCorn = UIAction(
            title: "싱글 콘",
            image: UIImage(named: "singleCorn")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "singleCorn")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "싱글 콘", englishName: "Single Corn", choice: 1, flavor: [], price: 4700, image: UIImage(named: "singleCorn")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let singleCup = UIAction(
            title: "싱글 컵",
            image: UIImage(named: "singleCup")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "singleCup")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "싱글 컵", englishName: "Single Cup", choice: 1, flavor: [], price: 4700, image: UIImage(named: "singleCup")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        let double = UIAction(
            title: "더블 콘",
            image: UIImage(named: "doubleCorn")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "doubleCorn")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "더블 콘", englishName: "Double Corn", choice: 2, flavor: [], price: 7300, image: UIImage(named: "doubleCorn")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let pint = UIAction(
            title: "파인트",
            image: UIImage(named: "pint")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "pint")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "파인트", englishName: "Pint", choice: 3, flavor: [], price: 9800, image: UIImage(named: "pint")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let quarter = UIAction(
            title: "쿼터",
            image: UIImage(named: "quarter")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "quarter")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "쿼터", englishName: "Quarter", choice: 4, flavor: [], price: 18500, image: UIImage(named: "quarter")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let family = UIAction(
            title: "패밀리",
            image: UIImage(named: "family")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "family")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "패밀리", englishName: "Family", choice: 5, flavor: [], price: 26000, image: UIImage(named: "family")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let halfGallon = UIAction(
            title: "하프갤런",
            image: UIImage(named: "halfGallon")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "halfGallon")!, for: .normal)
                self.selectedMenu = IceCream(koreanName: "하프 갤런", englishName: "Half-Gallon", choice: 6, flavor: [], price: 31500, image: UIImage(named: "halfGallon")!)
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
      
        
        let Items = [singleCorn,singleCup, double, pint, quarter, family, halfGallon]
        
        return Items
    }
    
    func configureEditMenu(){
        let menu = UIMenu(title: "메뉴", children: items)
        
        selectedMenuButton.menu = menu
        selectedMenuButton.showsMenuAsPrimaryAction = true
        
    }
}

