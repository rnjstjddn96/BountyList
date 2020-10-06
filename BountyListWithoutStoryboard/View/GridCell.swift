//
//  GridCell.swift
//  BountyListWithoutStoryboard
//
//  Created by 권성우 on 2020/10/04.
//  Copyright © 2020 swkwon. All rights reserved.
//

import Foundation
import UIKit

class GridCell: UICollectionViewCell {
    static let identifier = "GridCell"
    
    var imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
    
    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.black
        lbl.textAlignment = .center
        return lbl
    }()
    
    var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = UIColor.systemGray
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(info: BountyInfo) {
        imageView.image = info.image
        nameLabel.text = info.name
        priceLabel.text = String(info.bounty)
    }
}

extension GridCell {
    func setup() {
        self.addSubview(imageView)
        self.addSubview(nameLabel)
        self.addSubview(priceLabel)
        
        imageView.snp.makeConstraints { iv in
            iv.top.equalTo(self)
            iv.centerX.equalTo(self)
            iv.width.equalTo(self)
            iv.height.equalTo(self.snp.width).multipliedBy(1.5)
        }
        nameLabel.snp.makeConstraints { name in
            name.top.equalTo(imageView.snp.bottom)
            name.left.equalTo(imageView)
            name.width.equalTo(imageView)
            name.height.equalTo(nameLabel)
        }
        priceLabel.snp.makeConstraints { price in
            price.top.equalTo(nameLabel.snp.bottom).offset(8)
            price.left.equalTo(imageView)
            price.width.equalTo(imageView)
            price.height.equalTo(priceLabel)
        }
    }
}
