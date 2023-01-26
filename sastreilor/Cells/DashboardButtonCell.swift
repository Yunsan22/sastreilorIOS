//
//  DashboardButtonCell.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/30/22.
//

import UIKit

class DashboardButtonCell: UITableViewCell {
    
    @IBOutlet weak var viewBtn: UIControl!{
        didSet{
            viewBtn.layer.cornerRadius = viewBtn.frame.height/3
        }
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
