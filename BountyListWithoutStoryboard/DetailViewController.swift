//
//  DetailViewController.swift
//  BountyListWithoutStoryboard
//
//  Created by 권성우 on 2020/10/05.
//  Copyright © 2020 swkwon. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    let imgView: UIImageView? = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        // Do any additional setup after loading the view.
    }
    
    func configureLayout() {
        view.backgroundColor = .white
        
        guard let imageView = imgView else { return }
        self.view.addSubview(imageView)
        self.view.addSubview(nameLabel)
        self.view.addSubview(priceLabel)
        
        imageView.snp.makeConstraints { [weak self] iv in
            guard let self = self else { return }
            iv.centerX.equalToSuperview()
            iv.bottom.equalTo(self.view.snp.centerY)
            iv.width.equalTo(self.view).dividedBy(2)
            iv.height.equalTo(imageView.snp.width).multipliedBy(1.5)
        }
        
        nameLabel.snp.makeConstraints { name in
            name.centerX.equalToSuperview()
            name.top.equalTo(imageView.snp.bottom).offset(20)
            name.width.equalTo(imageView)
            name.height.equalTo(nameLabel)
        }
        
        priceLabel.snp.makeConstraints { price in
            price.centerX.equalToSuperview()
            price.top.equalTo(nameLabel.snp.bottom).offset(20)
            price.width.equalTo(imageView)
            price.height.equalTo(priceLabel)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
