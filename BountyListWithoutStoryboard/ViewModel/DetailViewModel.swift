//
//  DetailViewModel.swift
//  BountyListWithoutStoryboard
//
//  Created by 권성우 on 2020/10/06.
//  Copyright © 2020 swkwon. All rights reserved.
//

import Foundation
import UIKit

class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
