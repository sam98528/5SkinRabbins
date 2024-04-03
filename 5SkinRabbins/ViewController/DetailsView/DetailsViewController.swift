//
//  DetailsViewController.swift
//  5SkinRabbins
//
//  Created by Sam.Lee on 4/1/24.
//

import UIKit

class DetailsViewController: UIViewController  {
    let fontB = "BRB"
    let fontR = "BRR"
    
    var selectedFlavor : [Flavor] = []
    var selectedMenu : IceCream = IceCream(koreanName: "",EnglishName: "", choice: 2, flavor: [], price: 123, image: UIImage())
    
    
    var currentPage: Int = 0
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var selectedMenuButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectedFlavorCollectionView: UICollectionView!
    @IBOutlet weak var flavorCollectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
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
            cell.flavorNameLabel.font = UIFont(name: fontR, size: 13)
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
        
        cancelButton.layer.cornerRadius = cancelButton.bounds.height / 2
        cancelButton.clipsToBounds = true
        cancelButton.layer.borderColor = UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 0.05).cgColor
        cancelButton.layer.borderWidth = 2
        
        titleLabel.textColor = UIColor(red: 0.98, green: 0.42, blue: 0.51, alpha: 1.00)
        navigationBar.shadowImage = UIImage()
        
        pageControl.numberOfPages = Int(ceil(Double(Flavor.flavors.count) / Double(9)))
        pageControl.pageIndicatorTintColor = UIColor.systemGray
        pageControl.currentPageIndicatorTintColor = UIColor(red: 0.98, green: 0.42, blue: 0.51, alpha: 1.00)
    }
    
    func configureData(){
        let choice = selectedMenu.choice
        selectedFlavor = []
        for _ in 0..<choice{
            selectedFlavor.append(Flavor(name: "", image: UIImage(named: "icecream_line")!))
        }
    }
    
}

extension DetailsViewController {
    var items: [UIAction] {
        
        let single = UIAction(
            title: "싱글",
            image: UIImage(named: "Cherry Water Blast")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "Cherry Water Blast")!, for: .normal)
                self.selectedMenu.choice = 1
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let double = UIAction(
            title: "더블",
            image: UIImage(named: "Cherry Water Blast")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "Cherry Water Blast")!, for: .normal)
                self.selectedMenu.choice = 2
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let pint = UIAction(
            title: "파인트",
            image: UIImage(named: "Cherry Water Blast")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "Cherry Water Blast")!, for: .normal)
                self.selectedMenu.choice = 3
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let quater = UIAction(
            title: "쿼터",
            image: UIImage(named: "Cherry Water Blast")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "Cherry Water Blast")!, for: .normal)
                self.selectedMenu.choice = 4
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let halfGallon = UIAction(
            title: "패밀리",
            image: UIImage(named: "Cherry Water Blast")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "Cherry Water Blast")!, for: .normal)
                self.selectedMenu.choice = 5
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let family = UIAction(
            title: "하브갤런",
            image: UIImage(named: "Cherry Water Blast")!,
            handler: {[unowned self] _ in
                self.selectedMenuButton.setImage(UIImage(named: "Cherry Water Blast")!, for: .normal)
                self.selectedMenu.choice = 6
                self.configureData()
                self.selectedFlavorCollectionView.reloadData()
            })
        
        let Items = [single, double, pint, quater, halfGallon, family]
        
        return Items
    }
    
    func configureEditMenu(){
        let menu = UIMenu(title: "메뉴", children: items)
        
        selectedMenuButton.menu = menu
        selectedMenuButton.showsMenuAsPrimaryAction = true
        
    }
}

