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
    var cakes: [Cake] = []
    var beverages: [Beverage] = []
    var coffees: [Coffee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        segmentedControl.selectedSegmentIndex = 0
        loadIceCreams()
    }
    
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
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

