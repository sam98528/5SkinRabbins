//
//  ViewController.swift
//  5SkinRabbins
//
//  Created by Jeong-bok Lee on 4/2/24.
//
import UIKit

class MenuViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ThingsDelegate {
    func thingsChanged() {
        updateCartBadge()
    }
    
    
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    // 각 카테고리별 상품 배열
    var iceCreams: [IceCream] = IceCream.iceCream
    var cakes: [Cake] = Cake.cake
    var beverages: [Beverage] = Beverage.beverage
    var coffees: [Coffee] = Coffee.coffee
    
    var selectedIndex = 0
    
    @IBAction func cartButtonTouched(_ sender: Any) {
        let storyboard: UIStoryboard? = UIStoryboard(name: "PaymentStoryboard", bundle: Bundle.main)
        guard let vc = storyboard?.instantiateViewController(identifier: "PaymentViewController") as? PaymentViewController else {
            return
        }
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 그라데이션을 통해 하단으로 갈수록 어둡게 처리
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.withAlphaComponent(0.4).cgColor] // 그라데이션 색상 설정
        gradientLayer.locations = [0.7, 1.0] // 그라데이션의 위치 조정
        view.layer.addSublayer(gradientLayer)
        //titleLabel 폰트 설정
        titleLabel.font = UIFont(name: "OAGothic-ExtraBold", size: 34)
        titleLabel.textColor = UIColor(red: 1, green: 0.334, blue: 0.466, alpha: 1)
        switch selectedIndex{
        case 0:
            titleLabel.text = "Ice Cream"
        case 1:
            titleLabel.text = "Cake"
        case 2:
            titleLabel.text = "Beverage"
        case 3:
            titleLabel.text = "Coffee"
        default:
            return
        }
        //cartButton 컬러 설정
        cartButton.tintColor = UIColor(red: 1, green: 0.334, blue: 0.466, alpha: 1)
        // UICollectionViewFlowLayout을 사용하여 컬렉션 뷰의 레이아웃 설정
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8) // 상하좌우 여백 설정
        flowLayout.minimumLineSpacing = 12 // 행 간 최소 간격
        flowLayout.minimumInteritemSpacing = 12 // 열 간 최소 간격
        flowLayout.scrollDirection = .vertical // 스크롤 방향
        // 셀 크기 설정
        let itemWidth = (collectionView.bounds.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right - flowLayout.minimumInteritemSpacing) / 2 // 한 행에 2개의 셀이 들어가도록 설정
        let itemHeight = itemWidth * 1.4 // 가로:세로 비율
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView.collectionViewLayout = flowLayout
        let backBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: nil)
        backBarButtonItem.tintColor = UIColor(red: 0.98, green: 0.42, blue: 0.51, alpha: 1.00)
        backBarButtonItem.imageInsets = UIEdgeInsets(top: 0, left: 10, bottom: 50, right: 50)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        self.navigationController?.navigationBar.backIndicatorImage = UIImage()
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage()
        // 네비게이션 바 디자인 설정
        navigationController?.navigationBar.shadowImage = UIImage() // 네비게이션 바 아래 선 제거
        navigationController?.navigationBar.barTintColor = UIColor.systemBackground // 네비게이션 바 배경 컬러
        // 컬렉션 뷰 데이터 불러오기
        setupCollectionView()
        // 초기에는 세그먼트 인덱스 0으로 설정하고 아이스크림 상품을 로드
        segmentedControl.selectedSegmentIndex = selectedIndex
        loadIceCreams()
    }
    
    // 컬렉션 뷰 데이터 소스 설정
    func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        self.collectionView.register(ProductCollectionViewCell.nib(), forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
    }
    
    // 세그먼트 값 변경 시 동작
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
        
        // 컬렉션 뷰의 셀을 최상단으로 스크롤
        let indexPath = IndexPath(item: 0, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .top, animated: false)
    }
    
    
    // 컬렉션 뷰 셀 수 설정
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
    
    // 컬렉션 뷰 셀 선택 시 동작
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            // 아이스크림 상품 선택 시 상세 화면으로 이동
            print(iceCreams[indexPath.row].koreanName)
            let storyboard: UIStoryboard? = UIStoryboard(name: "DetailsView", bundle: Bundle.main)
            guard let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else {
                return
            }
            vc.selectedMenu = iceCreams[indexPath.row]
            vc.delegate = self
            vc.modalPresentationStyle = .automatic
            vc.modalTransitionStyle = .coverVertical
            self.present(vc, animated: true,completion: nil)
        case 1:
            // 케이크 상품 선택 시 동작
            //print(cakes[indexPath.row].koreanName)
            Menu.things.append(cakes[indexPath.row])
            updateCartBadge()
        case 2:
            // 음료 상품 선택 시 동작
            //print(beverages[indexPath.row].koreanName)
            Menu.things.append(beverages[indexPath.row])
            updateCartBadge()
        case 3:
            // 커피 상품 선택 시 동작
            //print(coffees[indexPath.row].koreanName)
            Menu.things.append(coffees[indexPath.row])
            updateCartBadge()
        default:
            print("error")
        }
    }
    
    // 컬렉션 뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        
        // 컬렉션 뷰 셀 디자인
        cell.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
        cell.layer.cornerRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor(red: 0.932, green: 0.932, blue: 0.932, alpha: 1).cgColor
        
        // 해당 카테고리의 상품으로 셀 구성
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
    
    // 카테고리별 상품 로드 함수
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
    func updateCartBadge() {
        cartButton.addBadge(number: Menu.things.count)
    }
}

// 뱃지 기능 추가, 애니메이션 효과
extension UIButton {
    
    func addBadge(number: Int) {
        // 뱃지가 0이면 숨김 처리
        if number == 0 {
            // 현재 버튼에 뱃지가 있다면 제거
            for subview in self.subviews {
                if subview is UILabel {
                    subview.removeFromSuperview()
                }
            }
            return
        }
        let badgeLabel = UILabel(frame: CGRect(x: self.frame.size.width - 16, y: -8, width: 28, height: 28))
        badgeLabel.layer.borderWidth = 1.0 // 스트로크 두께 설정
        badgeLabel.layer.borderColor = UIColor(red: 0.34, green: 0.29, blue: 0.24, alpha: 0.6).cgColor
        badgeLabel.backgroundColor = UIColor(red: 0.242, green: 0.242, blue: 0.242, alpha: 1)
        badgeLabel.textColor = .white
        badgeLabel.textAlignment = .center
        badgeLabel.layer.cornerRadius = badgeLabel.bounds.size.width / 2
        badgeLabel.layer.masksToBounds = true
        badgeLabel.text = "\(number)"
        badgeLabel.font = UIFont.systemFont(ofSize: 14)
        // Add new badge view with animation
        badgeLabel.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        self.addSubview(badgeLabel)
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [], animations: {
            badgeLabel.transform = .identity
        }, completion: nil)
    }
}

extension MenuViewController : FlavorDelegate {
    func finishedFlavorEditing(iceCream: IceCream) {
        Menu.things.append(iceCream)
        updateCartBadge()
    }
    
}
