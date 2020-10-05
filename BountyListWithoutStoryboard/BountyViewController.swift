//
//  ViewController.swift
//  BountyListWithoutStoryboard
//
//  Created by 권성우 on 2020/10/04.
//  Copyright © 2020 swkwon. All rights reserved.
//

import UIKit
import SnapKit

class BountyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var viewModel = BountyViewModel()
    
    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configure()
    }

    func configure() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.snp.makeConstraints { (m) in
            m.left.equalTo(view)
            m.right.equalTo(view)
            m.bottom.equalTo(view)
            m.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    //collectionView Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numOfBountyList
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as? GridCell else { return UICollectionViewCell() }
        let bountyInfo = self.viewModel.updateUI(indexPath.row)
        cell.update(info: bountyInfo)
        return cell
    }
    
    //collectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.imgView?.image = viewModel.sortedBountyList[indexPath.row].image
        detailViewController.nameLabel.text = viewModel.sortedBountyList[indexPath.row].name
        detailViewController.priceLabel.text = String(viewModel.sortedBountyList[indexPath.row].bounty)
        present(detailViewController, animated: true, completion: nil)
    }
    
    
    //collectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemSpacing: CGFloat = 10
        let textAreaHeight: CGFloat = 65

        let width: CGFloat = (collectionView.bounds.width - itemSpacing)/2
        let height: CGFloat = width * 10/7 + textAreaHeight
        return CGSize(width: width, height: height)
    }
}

