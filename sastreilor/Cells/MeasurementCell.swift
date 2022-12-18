//
//  MeasurementCell.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/17/22.
//

import UIKit

class MeasurementCell: UITableViewCell {

    @IBOutlet weak var alfabetorderLabel: UILabel!
    
    @IBOutlet weak var custMeasurementNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
