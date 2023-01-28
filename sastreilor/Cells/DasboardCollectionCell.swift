//
//  DasboardCollectionCell.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 12/30/22.
//

import UIKit

class DasboardCollectionCell: UICollectionViewCell {
    
    private let mycustomerTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    @IBOutlet weak var customerNameLabel: UILabel!
    
    @IBOutlet weak var measureImageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
