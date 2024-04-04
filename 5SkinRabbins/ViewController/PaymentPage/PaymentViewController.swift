
import UIKit

class PaymentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var things: [Any] = []
    var totalPriceLabel: UILabel?
    let font = "BRR"
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "paymentCell", for: indexPath) as! PaymentTableViewCell
        cell.payNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        cell.payPriceLabel.font = UIFont.boldSystemFont(ofSize: 14)
        cell.plusButton.tintColor = .black
        cell.minusButton.tintColor = .gray
        //셀 삭제
        cell.deleteButtonAction = { [weak self] in
            self?.deleteThing(at: indexPath) // 셀 삭제 메서드 호출
        }
        
        //총 금액 업데이트
        cell.updateTotalAmount = { [weak self] in
            self?.updateTotalAmount()
        }
        
        if let iceCream = things[indexPath.row] as? IceCream {
            cell.thingPrice = iceCream.price // thingPrice 값을 iceCream.price로 설정
        } else if let coffee = things[indexPath.row] as? Coffee {
            cell.thingPrice = coffee.price // thingPrice 값을 coffee.price로 설정
        } else if let cake = things[indexPath.row] as? Cake {
            cell.thingPrice = cake.price // thingPrice 값을 cake.price로 설정
        } else if let beverage = things[indexPath.row] as? Beverage {
            cell.thingPrice = beverage.price // thingPrice 값을 beverage.price로 설정
        }
        
        // ice cream
        if let thing = things[indexPath.row] as? IceCream {
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
            if let firstFlavorImage = thing.flavor.first?.image {
                cell.payImageView.image = firstFlavorImage
            } else {
                cell.payImageView.image = nil
            }
            //버튼
            cell.minusButtonAction = {
                if cell.cnt > 1 { cell.cnt -= 1 }
            }
            cell.plusButtonAction = {
                cell.cnt += 1
            }
        } else if let thing = things[indexPath.row] as? Coffee {
            // coffee
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = thing.image
        } else if let thing = things[indexPath.row] as? Cake {
            // cake
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = thing.image
        } else if let thing = things[indexPath.row] as? Beverage {
            //beverage
            cell.payNameLabel.text = thing.koreanName
            cell.payPriceLabel.text = "\(thing.price)원"
            cell.payImageView.image = thing.image
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //셀 삭제 메서드
    private func deleteThing(at indexPath: IndexPath) {
        guard !things.isEmpty else {
            // 장바구니가 비었을 때
            updateFooterView(for: true)
            return
        }
            
        guard indexPath.row < things.count else {
            return // 배열의 유효하지 않은 인덱스에 대한 처리
        }
            
        things.remove(at: indexPath.row) // 데이터 배열에서 해당 항목 삭제
        tableView.deleteRows(at: [indexPath], with: .left) // 테이블 뷰에서 해당 셀 삭제
        updateTotalAmount() // 총 금액 갱신
        
        // 모든 셀을 삭제한 후 장바구니가 비었습니다 메시지를 표시할 수도 있습니다.
        if things.isEmpty {
            updateFooterView(for: true)
        }
    }
    
    //장바구니가 비어있을 때
    private func updateFooterView(for isEmpty: Bool) {
        if isEmpty {
            // 장바구니가 비어있을 때의 footerView
            let emptyCartView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50))
            let messageLabel = UILabel(frame: emptyCartView.bounds)
            messageLabel.textAlignment = .center
            messageLabel.text = "장바구니가 비었습니다."
            emptyCartView.addSubview(messageLabel)
            tableView.tableFooterView = emptyCartView
        } else {
            // 장바구니에 물건이 있을 때의 footerView
            let footerHeight: CGFloat = 150
            let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: footerHeight))
            // 이하 footerView의 내용 설정 로직 추가
            // ...
            tableView.tableFooterView = footerView
        }
    }
    
    //총 금액 구하기
    private var totalAmount: Int {
        var total = 0
        for thing in things {
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
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: font, size: 18)!, NSAttributedString.Key.foregroundColor:UIColor(red: 0.98, green: 0.42, blue: 0.51, alpha: 1.00)]
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
        
        
        things.append(
            IceCream(koreanName: "파인트",
                     englishName: "pint",
                     choice: 3,
                     flavor: [
                        Flavor(name: "바닐라", image: UIImage(named: "Vanilla")!),
                        Flavor(name: "월넛", image: UIImage(named:"Walnut")!)],
                     price: 100,
                     image: UIImage(named: "Vanilla")!))
        
        things.append(
            IceCream(koreanName: "패밀리",
                     englishName: "family",
                     choice: 4,
                     flavor: [
                        Flavor(name: "망고 탱고", image: UIImage(named: "Mango Tango")!),
                        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named:"New York CheeseCake")!)],
                     price: 100,
                     image: UIImage(named: "New York CheeseCake")!))
        
        things.append(
            IceCream(koreanName: "패밀리",
                     englishName: "family",
                     choice: 4,
                     flavor: [
                        Flavor(name: "망고 탱고", image: UIImage(named: "Mango Tango")!),
                        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named:"New York CheeseCake")!)],
                     price: 300,
                     image: UIImage(named: "New York CheeseCake")!))
        
        things.append(
            IceCream(koreanName: "패밀리",
                     englishName: "family",
                     choice: 4,
                     flavor: [
                        Flavor(name: "망고 탱고", image: UIImage(named: "Mango Tango")!),
                        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named:"New York CheeseCake")!)],
                     price: 400,
                     image: UIImage(named: "New York CheeseCake")!))
        
        things.append(
            IceCream(koreanName: "패밀리",
                     englishName: "family",
                     choice: 4,
                     flavor: [
                        Flavor(name: "망고 탱고", image: UIImage(named: "Mango Tango")!),
                        Flavor(name: "뉴욕 치즈케이크", image: UIImage(named:"New York CheeseCake")!)],
                     price: 200,
                     image: UIImage(named: "New York CheeseCake")!))
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let nibName = UINib(nibName: "PaymentTableViewCell", bundle: Bundle(for: type(of: self)))
        
        tableView.register(nibName, forCellReuseIdentifier: "paymentCell")
        
        tableView.reloadData()
        
    }
    
    //footerView
    private func createFooterView() -> UIView {
        var footerView = UIView()
        let footerHeight: CGFloat = 150
        footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: footerHeight))
        footerView.backgroundColor = .white
            
        let label = UILabel()
        let formattedAmount = formatCurrency(amount: totalAmount)
        label.text = "총 결제금액  \(formattedAmount)원"
        label.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(label)
        self.totalPriceLabel = label
            
        let button1 = UIButton(type: .system)
        button1.setTitle("취소하기", for: .normal)
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button1.translatesAutoresizingMaskIntoConstraints = false
        footerView.addSubview(button1)
            
        button1.setTitleColor(.systemPink, for: .normal)
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
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
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button2.backgroundColor = .systemPink
        button2.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 30),
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
            self.things.removeAll()
            self.tableView.reloadData()
            self.updateTotalAmount()
            self.updateFooterView()
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
            self.things.removeAll()
            self.tableView.reloadData()
            self.updateTotalAmount()
            self.updateFooterView()
        }
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    private func updateFooterView() {
        let isEmpty = things.isEmpty
        updateFooterView(for: isEmpty)
    }

}
