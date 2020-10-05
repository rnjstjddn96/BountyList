//
//  BountyViewModel.swift
//  BountyListWithoutStoryboard
//
//  Created by 권성우 on 2020/10/04.
//  Copyright © 2020 swkwon. All rights reserved.
//

import Foundation

class BountyViewModel {
    var bountyInfo: BountyInfo?
    
    var bountyInfoList: [BountyInfo] = [
    BountyInfo(name: "brook", bounty: 33000000),
    BountyInfo(name: "chopper", bounty: 50),
    BountyInfo(name: "franky", bounty: 44000000),
    BountyInfo(name: "luffy", bounty: 300000000),
    BountyInfo(name: "nami", bounty: 16000000),
    BountyInfo(name: "robin", bounty: 80000000),
    BountyInfo(name: "sanji", bounty: 77000000),
    BountyInfo(name: "zoro", bounty: 120000000)]
        
    var sortedBountyList: [BountyInfo] {
        return bountyInfoList.sorted { prev, next in
            return prev.bounty > next.bounty
        }
    }
    
    var numOfBountyList: Int {
        return sortedBountyList.count
    }
    
    func updateUI(_ index: Int) -> BountyInfo {
        return bountyInfoList[index]
    }
}
