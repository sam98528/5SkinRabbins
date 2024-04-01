//
//  DetailsViewController.swift
//  5SkinRabbins
//
//  Created by Sam.Lee on 4/1/24.
//

import UIKit

class DetailsViewController: UIViewController  {

    var selectedFlavor : [Flavor] = [Flavor(name: "", image: UIImage(named: "icecream_line")!),Flavor(name: "", image: UIImage(named: "icecream_line")!),Flavor(name: "", image: UIImage(named: "icecream_line")!)]
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectedFlavorCollectionView: UICollectionView!
    @IBOutlet weak var flavorCollectionView: UICollectionView!
    @IBOutlet weak var selectedMenuImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViews()
        configureView()
    }

    
}

// CollectionView
extension DetailsViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func configureCollectionViews(){
        self.selectedFlavorCollectionView.dataSource = self
        self.selectedFlavorCollectionView.delegate = self
        selectedFlavorCollectionView.register(SelectedFlavorCollectionViewCell.nib(), forCellWithReuseIdentifier: SelectedFlavorCollectionViewCell.identifier)
        
        let selectedFlowLayout = UICollectionViewFlowLayout()
        selectedFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 30, bottom: 10, right: 30)
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
            selectedFlavor[indexPath.row].image = UIImage(named: "icecream_line")!
            selectedFlavorCollectionView.reloadItems(at: [indexPath])
            
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
    
}

extension DetailsViewController {
    
    func configureView(){
        confirmButton.layer.cornerRadius = confirmButton.layer.bounds.height / 2
        confirmButton.clipsToBounds = true
        confirmButton.layer.borderColor = UIColor.black.cgColor
        confirmButton.layer.borderWidth = 2
        
        cancelButton.layer.cornerRadius = cancelButton.layer.bounds.height / 2
        cancelButton.clipsToBounds = true
        cancelButton.layer.borderColor = UIColor.black.cgColor
        cancelButton.layer.borderWidth = 2
    }
}
