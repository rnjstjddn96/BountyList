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
    
    let viewModel = DetailViewModel()
    var nameLabelCenterX: Constraint? = nil
    var priceLabelCenterX: Constraint? = nil
    
    let imgView: UIImageView? = {
        let iv = UIImageView()
        return iv
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        return lbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureLayout()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showAnimation()
    }
    
    func prepareAnimation() {
        self.nameLabelCenterX?.update(offset: 300)
        self.priceLabelCenterX?.update(offset: 300)
    }
    
    func showAnimation() {
        self.nameLabelCenterX?.update(offset: 0)
        self.priceLabelCenterX?.update(offset: 0)
        
        UIView.animate(withDuration: 0.3,
                       delay: 0.1,
                       options: .curveEaseIn,
                       animations:  { [weak self] in
            guard let self = self else  { return }
            self.view.layoutIfNeeded()
        })
        
        guard let imgView = imgView else { return }
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    
    func updateUI() {
        guard let bountyInfo = viewModel.bountyInfo else { return }
        imgView?.image = bountyInfo.image
        nameLabel.text = bountyInfo.name
        priceLabel.text = String(bountyInfo.bounty)
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
            iv.centerY.equalTo(self.view.snp.centerY).offset(-30)
            iv.width.equalTo(self.view).dividedBy(1.3)
            iv.height.equalTo(imageView.snp.width).multipliedBy(1.5)
        }
        
        nameLabel.snp.makeConstraints { [weak self] name in
            guard let self = self else { return }
            self.nameLabelCenterX = name.centerX.equalToSuperview().constraint
            nameLabelCenterX?.activate()
            name.top.equalTo(imageView.snp.bottom).offset(30)
            name.width.equalTo(imageView)
            name.height.equalTo(nameLabel)
        }
        
        priceLabel.snp.makeConstraints { [weak self] price in
            guard let self = self else { return }
            self.priceLabelCenterX = price.centerX.equalToSuperview().constraint
            priceLabelCenterX?.activate()
            price.top.equalTo(nameLabel.snp.bottom).offset(20)
            price.width.equalTo(imageView)
            price.height.equalTo(priceLabel)
        }
    }
}
