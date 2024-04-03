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
//    @IBOutlet weak var productImageView: UIImageView!
//    @IBOutlet weak var productNameLabel: UILabel!
//    @IBOutlet weak var productPriceLabel: UILabel!
    
    var iceCreams: [IceCream] = []
    var cakes: [Cake] = Cake.cake
    var beverages: [Beverage] = Beverage.beverage
    var coffees: [Coffee] = Coffee.coffee
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowLayout.minimumLineSpacing = 5
        flowLayout.minimumInteritemSpacing = 5
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
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            loadIceCreams()
        case 1:
            loadCakes()
        case 2:
            loadBeverages()
        case 3:
            loadCoffees()
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

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        cell.layer.borderWidth = 2
        
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

