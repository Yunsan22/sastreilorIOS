//
//  MycustomButton.swift
//  sastreilor
//
//  Created by Yunior Sanchez on 1/27/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
class MycustomButton: UIButton {
    
    private let myTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let mySubTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    private let myIconView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.tintColor = .white
        return image
    }()
    
    private var viewModel: myCustomButtnViewmodel?
    
    override init(frame: CGRect) {
        self.viewModel = nil
        super.init(frame: frame)
    }
    
    init(with viewModel: myCustomButtnViewmodel){
        self.viewModel = viewModel
        super.init(frame: .zero)
              
        
        addSubviews()
        configure(with: viewModel)
    }
    private func addSubviews(){
        guard !myTitleLabel.isDescendant(of: self) else {
            return
        }
        addSubview(myTitleLabel)
        addSubview(mySubTitleLabel)
        addSubview(myIconView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with viewModel: myCustomButtnViewmodel){
        
        layer.masksToBounds = true
        layer.cornerRadius = 8
        layer.borderWidth = 1.5
        
        addSubviews()
        
        myTitleLabel.text = viewModel.title
        mySubTitleLabel.text = viewModel.subTittle
        myIconView.image = UIImage(named: viewModel.imagename)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myIconView.frame = CGRect(
            x: 40,
            y: 3,
            width: 50,
            height: frame.height
        ).integral
        
        myTitleLabel.frame = CGRect(
            x: 40,
            y: 10,
            width: frame.width - 50,
            height: (frame.height-10)/2
        ).integral
        
        mySubTitleLabel.frame = CGRect(
            x: 50,
            y: 40,
            width: frame.width - 65,
            height: (frame.height - 10)/2
        ).integral
    }
    
}

struct myCustomButtnViewmodel {
    let title: String
    let subTittle: String
    let imagename: String
}
