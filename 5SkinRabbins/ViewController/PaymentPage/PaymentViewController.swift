
import UIKit
protocol ThingsDelegate {
    func thingsChanged()
}


class PaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var delegate : ThingsDelegate?
    var totalPriceLabel: UILabel?
    let font = "OAGothic-ExtraBold"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Menu.things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        cell.payNameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        cell.payDetailLabel.font = UIFont.systemFont(ofSize: 15)
        cell.payPriceLabel.font = UIFont.boldSystemFont(ofSize: 22)
        cell.cntLabel.font = UIFont.systemFont(ofSize: 22)
        
        cell.plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        cell.minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 27)
        cell.plusButton.tintColor = .black
        cell.minusButton.tintColor = .gray
        
        cell.payDetailLabel.numberOfLines = 0
        
        //셀 삭제
        cell.deleteButtonAction = { [weak self] in
            self?.deleteThing(at: indexPath) // 셀 삭제 메서드 호출
        }
        
        //총 금액 업데이트
        cell.updateTotalAmount = { [weak self] in
            self?.updateTotalAmount()
        }
        
        if let iceCream = Menu.things[indexPath.row] as? IceCream {
            cell.thingPrice = iceCream.price // thingPrice 값을 iceCream.price로 설정
        } else if let coffee = Menu.things[indexPath.row] as? Coffee {
            cell.thingPrice = coffee.price // thingPrice 값을 coffee.price로 설정
        } else if let cake = Menu.things[indexPath.row] as? Cake {
            cell.thingPrice = cake.price // thingPrice 값을 cake.price로 설정
        } else if let beverage = Menu.things[indexPath.row] as? Beverage {
            cell.thingPrice = beverage.price // thingPrice 값을 beverage.price로 설정
        }
        
        // ice cream
        if let thing = Menu.things[indexPath.row] as? IceCream {
            // 이름
            cell.payNameLabel.text = thing.koreanName
            // 가격
            cell.payPriceLabel.text = "\(thing.price)원"
            // 선택한 맛
            var flavorText = ""
            for (index, flavor) in thing.flavor.enumerated() {
                flavorText += flavor.name
                if index < thing.flavor.count - 1 {
                    flavorText += ", "
                }
            }
            cell.payDetailLabel.text = flavorText
            //이미지 (일단은 고른 맛에 첫번째 이미지로..)
            /*
            if let firstFlavorImage = thing.flavor.first?.image {
                cell.payImageView.image = firstFlavorImage
            } else {
                cell.payImageView.image = nil
            }
             */
            cell.payImageView.image = thing.image
            //버튼
            cell.minusButtonAction = {
                if cell.cnt > 1 { cell.cnt -= 1 }
            }
            cell.plusButtonAction = {
                cell.cnt += 1
            }
            cell.payNameLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 30).isActive = true // payNameLabel 상단 여백 설정
        } else if let thing = Menu.things[indexPath.row] as? Coffee {
            // coffee
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = thing.image
            cell.payDetailLabel.text = ""
            //버튼
            cell.minusButtonAction = {
                if cell.cnt > 1 { cell.cnt -= 1 }
            }
            cell.plusButtonAction = {
                cell.cnt += 1
            }
            
            // 아이스크림이 아닌 셀을 레이아웃 변경
            cell.payDetailLabel.isHidden = true
            
            cell.payNameLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 30).isActive = true // payNameLabel 상단 여백 설정
            cell.payPriceLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 95).isActive = true
            cell.plusButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.minusButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.cntLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.payImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
            
            
        } else if let thing = Menu.things[indexPath.row] as? Cake {
            // cake
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = thing.image
            cell.payDetailLabel.text = ""
            //버튼
            cell.minusButtonAction = {
                if cell.cnt > 1 { cell.cnt -= 1 }
            }
            cell.plusButtonAction = {
                cell.cnt += 1
            }
            
            // 아이스크림이 아닌 셀을 레이아웃 변경
            cell.payDetailLabel.isHidden = true
            
            cell.payNameLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 30).isActive = true // payNameLabel 상단 여백 설정
            cell.payPriceLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 95).isActive = true
            cell.plusButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.minusButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.cntLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.payImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
            
        } else if let thing = Menu.things[indexPath.row] as? Beverage {
            //beverage
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = thing.image
            cell.payDetailLabel.text = ""
            //버튼
            cell.minusButtonAction = {
                if cell.cnt > 1 { cell.cnt -= 1 }
            }
            cell.plusButtonAction = {
                cell.cnt += 1
            }
            
            // 아이스크림이 아닌 셀을 레이아웃 변경
            cell.payDetailLabel.isHidden = true
            
            cell.payNameLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 30).isActive = true // payNameLabel 상단 여백 설정
            cell.payPriceLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 95).isActive = true
            cell.plusButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.minusButton.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.cntLabel.topAnchor.constraint(equalTo: cell.topAnchor, constant: 90).isActive = true
            cell.payImageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20).isActive = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //셀 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let _ = Menu.things[indexPath.row] as? IceCream {
                // 아이스크림 셀인 경우
                return 220
            } else {
                // 아이스크림이 아닌 경우
                return 150 // 원하는 높이로 설정
            }
    }

    //셀 삭제 메서드
    private func deleteThing(at indexPath: IndexPath) {
        guard !Menu.things.isEmpty else {
            // 장바구니가 비었을 때
            EmptySubView()
            return
        }
            
        guard indexPath.row < Menu.things.count else {
            return // 배열의 유효하지 않은 인덱스에 대한 처리
        }
            
        Menu.things.remove(at: indexPath.row) // 데이터 배열에서 해당 항목 삭제
        tableView.deleteRows(at: [indexPath], with: .left) // 테이블 뷰에서 해당 셀 삭제
        updateTotalAmount() // 총 금액 갱신
        
        // 모든 셀을 삭제한 후 장바구니가 비었습니다 메시지를 표시할 수도 있습니다.
        if Menu.things.isEmpty {
            EmptySubView()
        }
    }
    
    //장바구니가 비어있을 때 (서브 뷰로 변경)
    private func EmptySubView() {
        let isEmpty = Menu.things.isEmpty
        if isEmpty {
            // 장바구니가 비어있는 경우
            let emptyCartView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: tableView.bounds.height))
                let messageLabel = UILabel()
                messageLabel.textAlignment = .center
                messageLabel.text = "장바구니가 비었습니다."
                messageLabel.textColor = .lightGray
                messageLabel.font = UIFont.systemFont(ofSize: 23)
                
                emptyCartView.addSubview(messageLabel)
                tableView.backgroundView = emptyCartView
                tableView.separatorStyle = .none
            
                // Auto Layout을 사용하여 messageLabel을 화면 중앙에 배치합니다.
                messageLabel.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    messageLabel.centerXAnchor.constraint(equalTo: emptyCartView.centerXAnchor),
                    messageLabel.centerYAnchor.constraint(equalTo: emptyCartView.centerYAnchor, constant: -50)
                ])
        } else {
            // 장바구니에 물건이 있는 경우
            tableView.backgroundView = nil
            tableView.separatorStyle = .singleLine
        }
    }
    
    //총 금액 구하기
    private var totalAmount: Int {
        var total = 0
        for thing in Menu.things {
            if let iceCream = thing as? IceCream {
                total += iceCream.price
            } else if let coffee = thing as? Coffee {
                total += coffee.price
            } else if let cake = thing as? Cake {
                total += cake.price
            } else if let beverage = thing as? Beverage {
                total += beverage.price
            }
        }
        return total
    }
    
    private func updateTotalAmount() {
        var total = 0
        
        for indexPath in tableView.indexPathsForVisibleRows ?? [] {
            let cell = tableView.cellForRow(at: indexPath) as? PaymentTableViewCell
            let itemPriceText = cell?.payPriceLabel.text ?? "0" // payPriceLabel의 텍스트 가져오기
            let itemPrice = Int(itemPriceText.replacingOccurrences(of: "원", with: "")) ?? 0
            total += itemPrice
        }
        
        let formattedAmount = formatCurrency(amount: total)
        totalPriceLabel?.text = "총 결제금액  \(formattedAmount)원"
    }
    
    // 총 금액에 쉼표 표시하는 함수
    private func formatCurrency(amount: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale.current // 현재 지역 설정에 따라 통화 표시 방식이 달라집니다.
        
        if let formattedAmount = formatter.string(from: NSNumber(value: amount)) {
            return formattedAmount
        } else {
            return "\(amount)" // 포맷에 실패할 경우 원래 값 그대로 반환
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 총 금액 업데이트
        updateTotalAmount()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.title = "주문 내역"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: font, size: 22)!, NSAttributedString.Key.foregroundColor:UIColor(red: 1, green: 0.334, blue: 0.466, alpha: 1)]
        
        //footerView 수정
        let footerView = createFooterView()
        view.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.heightAnchor.constraint(equalToConstant: 150) // 필요한 높이로 설정
        ])
        updateTotalAmount() //총 금액 초기화
        
        //footerView에 가려지지 않게
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: footerView.bounds.height, right: 0)
        tableView.contentInset = contentInset
        tableView.scrollIndicatorInsets = contentInset
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "PaymentTableViewCell", bundle: Bundle(for: type(of: self)))
        
        tableView.register(nibName, forCellReuseIdentifier: "paymentCell")
        
        tableView.reloadData()
        EmptySubView()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.delegate?.thingsChanged()
    }
    //footerView
    private func createFooterView() -> UIView {
        var footerView = UIView()
        let footerHeight: CGFloat = 150
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: footerHeight))
        footerView.backgroundColor = UIColor.systemBackground
            
        let label = UILabel()
        let formattedAmount = formatCurrency(amount: totalAmount)
        label.text = "총 결제금액  \(formattedAmount)원"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(label)
        self.totalPriceLabel = label
        
            
        let button1 = UIButton(type: .system)
        button1.setTitle("취소하기", for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(button1)
            
        button1.setTitleColor(UIColor(red: 1, green: 0.334, blue: 0.466, alpha: 1), for: .normal)
        button1.titleLabel?.font = UIFont(name: "LINESeedSansKR-Bold", size: 17)
        button1.backgroundColor = .white
        button1.layer.cornerRadius = 10
        button1.layer.borderWidth = 0.5
        button1.layer.borderColor = UIColor.gray.cgColor
        
        let button2 = UIButton(type: .system)
        button2.setTitle("주문하기", for: .normal)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button2.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(button2)
        
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont(name: "LINESeedSansKR-Bold", size: 17)
        button2.backgroundColor = UIColor(red: 1, green: 0.334, blue: 0.466, alpha: 1)
        button2.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -30), // 오른쪽으로 정렬
            
            button1.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 20),
            button1.widthAnchor.constraint(equalToConstant: 160),
            
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 20),
            button2.topAnchor.constraint(equalTo: button1.topAnchor),
            button2.trailingAnchor.constraint(lessThanOrEqualTo: footerView.trailingAnchor, constant: -20),
            button2.bottomAnchor.constraint(lessThanOrEqualTo: footerView.bottomAnchor, constant: -20),
            button2.widthAnchor.constraint(equalToConstant: 160),
        ])
        
        return footerView
    }
    
    @objc func button1Tapped() {
        let alertController = UIAlertController(title: "", message: "주문을 취소하시겠습니까?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .destructive) { _ in
            // 확인 버튼을 눌렀을 때 장바구니를 비움
            Menu.things.removeAll()
            self.tableView.reloadData()
            self.updateTotalAmount()
            self.EmptySubView()
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
            
        present(alertController, animated: true, completion: nil)
    }

    @objc func button2Tapped() {
        let alertController = UIAlertController(title: "", message: "결제 하시겠습니까?", preferredStyle: .alert)
            
        let confirmAction = UIAlertAction(title: "예", style: .default) { _ in
            // 예 선택 시
            self.confirmOrder()
        }
        let cancelAction = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
            
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
            
        present(alertController, animated: true, completion: nil)
    }
    private func confirmOrder() {
        let alertController = UIAlertController(title: "", message: "결제가 완료되었습니다.", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
            // 결제가 완료되었으므로 장바구니를 비우고 화면을 업데이트합니다.
            Menu.things.removeAll()
            self.tableView.reloadData()
            self.updateTotalAmount()
            self.EmptySubView()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    

}
