//
//  SIBaseViewController.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/16/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

class SIBaseViewController: UIViewController {
    
    static var tempCounter = 1

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Type methods example
    
    class func overridebleTypeMethod() -> Int {
        self.tempCounter++
        return 5
    }
    
    static func typeMethod() -> Int {
        self.tempCounter++
        return 5
    }

}
