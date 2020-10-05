//
//  File.swift
//  BountyListWithoutStoryboard
//
//  Created by 권성우 on 2020/10/04.
//  Copyright © 2020 swkwon. All rights reserved.
//

import Foundation
import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: name)
    }
    
    init(name: String, bounty: Int) {
        self.name = name
        self.bounty = bounty
    }
}
