//
//  SIReferencesExample.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/18/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit{
        
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
}

class SIReferencesExample: NSObject {
    var john: Customer?
    var tempCard: CreditCard?
    
    func createTempCard() {
        self.john = Customer(name: "Vasya Pupkin")
        self.john!.card = CreditCard(number: 1234_5678_9012_3456, customer: self.john!)
    }
    
    func createTempCardIncorrectWay() {
        var customer:Customer? = Customer(name: "Vasya Pupkin")
        self.tempCard = CreditCard(number: 1234_5678_9012_3456, customer: customer!)
        customer = nil;
    }
   
}
