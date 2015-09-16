//
//  SITableViewCellExtensions.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/16/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class func si_defaultReuseIdentifier() -> String {
        return NSStringFromClass(self)
    }
    
}