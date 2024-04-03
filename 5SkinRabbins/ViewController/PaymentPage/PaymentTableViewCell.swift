
import UIKit

class PaymentTableViewCell: UITableViewCell {
    //테이블 뷰 셀 구성
    @IBOutlet weak var payImageView: UIImageView!
    @IBOutlet weak var payNameLabel: UILabel!
    @IBOutlet weak var payDetailLabel: UILabel!
    @IBOutlet weak var payPriceLabel: UILabel!
    
    //셀 삭제 "X" 버튼
    var deleteButtonAction: (() -> Void)?
    
    @IBAction func xTapped(_ sender: Any) {
        deleteButtonAction?()
    }
    
    //증가 감소 버튼
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var cntLabel: UILabel!
    
    var minusButtonAction: (() -> Void)?
    var plusButtonAction: (() -> Void)?
    
    var cnt: Int = 1 {
        didSet {
            cntLabel.text = "\(cnt)"
            minusButton.isEnabled = cnt > 1
            minusButton.tintColor = cnt > 1 ? .black : .gray
        }
    }

    @IBAction func plusTapped(_ sender: Any) {
        plusButtonAction?()
        updatePriceLabel()
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        minusButtonAction?()
        updatePriceLabel()
    }
    
    var thingPrice:Int = 0 //thing.price 값 저장
    
    private func updatePriceLabel() {
        let totalPrice = cnt * thingPrice // 현재 수량과 thingPrice 값을 곱해서 총 가격 계산
        payPriceLabel.text = "\(totalPrice)원" // 가격 레이블 업데이트
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
