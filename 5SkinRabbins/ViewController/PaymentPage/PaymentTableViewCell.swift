
import UIKit

class PaymentTableViewCell: UITableViewCell {

    @IBOutlet weak var payImageView: UIImageView!
    
    @IBOutlet weak var payNameLabel: UILabel!
    
    @IBOutlet weak var payDetailLabel: UILabel!
    
    @IBOutlet weak var payPriceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
