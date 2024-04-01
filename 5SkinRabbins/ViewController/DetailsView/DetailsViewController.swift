//
//  DetailsViewController.swift
//  5SkinRabbins
//
//  Created by Sam.Lee on 4/1/24.
//

import UIKit

class DetailsViewController: UIViewController  {

    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var selectedFlavorCollectionView: UICollectionView!
    @IBOutlet weak var flavorCollectionView: UICollectionView!
    @IBOutlet weak var selectedMenuImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionViews()
        
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            print("CollectionView Size: \(flavorCollectionView.frame.size)")
        }

}


extension DetailsViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func configureCollectionViews(){
        //self.selectedFlavorCollectionView.dataSource = self
        //self.selectedFlavorCollectionView.delegate = self
    
        
        self.flavorCollectionView.dataSource = self
        self.flavorCollectionView.delegate = self
        flavorCollectionView.register(DetailsCollectionViewCell.nib(), forCellWithReuseIdentifier: DetailsCollectionViewCell.identifier)
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: Int(flavorCollectionView.frame.size.width / 3), height: Int(flavorCollectionView.frame.size.width / 3))
        flavorCollectionView.collectionViewLayout = flowLayout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Flavor.flavors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.identifier, for: indexPath) as! DetailsCollectionViewCell
        
        cell.flavorImageView.image = Flavor.flavors[indexPath.row].image
        cell.flavorNameLabel.text = Flavor.flavors[indexPath.row].name
        return cell
    }
    
}
