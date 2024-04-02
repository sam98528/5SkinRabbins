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
    
    // 각 카테고리에 해당하는 상품 데이터
    var iceCreams: [IceCream] = []
    var cakes: [Cake] = []
    var beverages: [Beverage] = []
    var coffees: [Coffee] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupCollectionView()
        // 초기에는 아이스크림 카테고리를 표시
        segmentedControl.selectedSegmentIndex = 0
        loadIceCreams()
    }
    
    // 컬렉션 뷰 설정
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // 세그먼트 컨트롤 값 변경 시 호출되는 메서드
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
    
    // 컬렉션 뷰 데이터 소스 메서드
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iceCreams.count // 선택된 카테고리에 해당하는 상품 수 반환
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
        let iceCream = iceCreams[indexPath.item]
        // 상품 정보 설정
        cell.configure(with: iceCream)
        return cell
    }
    
    // 각 카테고리에 해당하는 상품을 로드하는 메서드들
    func loadIceCreams() {
        // iceCreams 배열에 아이스크림 상품 데이터를 로드하는 코드
        collectionView.reloadData()
    }
    
    func loadCakes() {
        // cakes 배열에 케이크 상품 데이터를 로드하는 코드
        collectionView.reloadData()
    }
    
    func loadBeverages() {
        // beverages 배열에 음료 상품 데이터를 로드하는 코드
        collectionView.reloadData()
    }
    
    func loadCoffees() {
        // coffees 배열에 커피 상품 데이터를 로드하는 코드
        collectionView.reloadData()
    }
}
