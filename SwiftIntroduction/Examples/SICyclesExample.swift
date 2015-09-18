//
//  SICyclesExample.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/18/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

class SICyclesExample: NSObject {
    let values = [1, 25, 40, 9, 17, 8]
    
    // MARK: - Overloading
   
    func print() {
        //print smth
    }
    
    func print(arg: Int) {
        Swift.print("value \(arg)")
    }
    
    func print(args :Int...) {
        for arg in args {
            self.print(arg)
        }
    }
    
    // MARK: - Cycles
    
    func iterateExample() {
        let count = self.values.count //6
        for i in 0..<count {
            self.print(i)
        }
        
        //outputs indexes:0 1 2 3 4 5
        
        
        for i in 0...count {
            self.print(i)
        }
        
        //outputs indexes:0 1 2 3 4 5 6
    }
}
