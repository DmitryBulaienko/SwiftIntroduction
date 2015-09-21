//
//  SIGenericsExample.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/21/15.
//  Copyright © 2015 Applikey Solutions. All rights reserved.
//

import Foundation

class SIBasket<TItem: Equatable> : NSObject {
    var items = [TItem]()
    
    func add(item: TItem) {
        self.items.append(item)
    }
    
    func remove(item: TItem) {
        let index = self.items.indexOf((item))
        if index != nil {
            self.items.removeAtIndex(index!)
        }
    }
    
    func removeAll() {
        self.items.removeAll()
    }
    
    func printItems() {
        for item in self.items {
            print(item)
        }
    }
}


class SIGenericsExample : NSObject {
    
    
    func swapTwoValues<T>(inout a: T, inout _ b: T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    // MARK: - demo
    
    func demo() {
        var a = 10;
        var b = 123;
        self.swapTwoValues(&a, &b)
        
        var tempString = "ab";
        var tempString2 = "cd";
        
        self.swapTwoValues(&tempString, &tempString2)
        
        //basket demo
        let basketInt = SIBasket<Int>()
        basketInt.add(1)
        basketInt.add(12)
        basketInt.printItems()

        let basketString = SIBasket<String>()
        basketString.add("temp")
        basketString.add("temp 2")
        basketString.printItems()
    }
}