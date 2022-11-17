import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelWrapper: UIView!
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        labelWrapper.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
