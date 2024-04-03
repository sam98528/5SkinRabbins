//
//  ViewController.swift
//  5SkinRabbins
//
//  Created by Jeong-bok Lee on 4/2/24.
//
import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var iceCreams: [IceCream] = IceCream.iceCream
    var cakes: [Cake] = Cake.cake
    var beverages: [Beverage] = Beverage.beverage
    var coffees: [Coffee] = Coffee.coffee
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 15
        flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: Int(collectionView.frame.size.width / 2 - 20) , height: Int(collectionView.frame.size.height / 3) - 20)
        collectionView.collectionViewLayout = flowLayout
        
        setupCollectionView()
        segmentedControl.selectedSegmentIndex = 0
        loadIceCreams()
        
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    // 세그먼트 선택 시 변경
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            loadIceCreams()
            titleLabel.text = "Ice Cream"
        case 1:
            loadCakes()
            titleLabel.text = "Ice Cream Cake"
        case 2:
            loadBeverages()
            titleLabel.text = "Beverage"
        case 3:
            loadCoffees()
            titleLabel.text = "Coffee"
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return iceCreams.count
        case 1:
            return cakes.count
        case 2:
            return beverages.count
        case 3:
            return coffees.count
        default:
            return 0
        }
    }
    
    // 다른 뷰 호출
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print(iceCreams[indexPath.row].koreanName)
            let storyboard: UIStoryboard? = UIStoryboard(name: "DetailsView", bundle: Bundle.main)
            guard let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") else {
                return
            }
            vc.modalPresentationStyle = .automatic
            vc.modalTransitionStyle = .coverVertical
            self.present(vc, animated: true,completion: nil)
        case 1:
            print(cakes[indexPath.row].koreanName)
        case 2:
            print(beverages[indexPath.row].koreanName)
        case 3:
            print(coffees[indexPath.row].koreanName)
        default:
            print("error")
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
         // 컬렉션 뷰 셀 디자인
//       cell.frame = CGRect(x: 0, y: 0, width: 164, height: 200)
         cell.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
         cell.layer.cornerRadius = 8
         cell.layer.borderWidth = 1
         cell.layer.borderColor = UIColor(red: 0.932, green: 0.932, blue: 0.932, alpha: 1).cgColor
     
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            let iceCream = iceCreams[indexPath.item]
            cell.configure(with: iceCream)
        case 1:
            let cake = cakes[indexPath.item]
            cell.configure(with: cake)
        case 2:
            let beverage = beverages[indexPath.item]
            cell.configure(with: beverage)
        case 3:
            let coffee = coffees[indexPath.item]
            cell.configure(with: coffee)
        default:
            break
        }
        return cell
    }
    
    func loadIceCreams() {
        collectionView.reloadData()
    }
    
    func loadCakes() {
        collectionView.reloadData()
    }
    
    func loadBeverages() {
        collectionView.reloadData()
    }
    
    func loadCoffees() {
        collectionView.reloadData()
    }
}

