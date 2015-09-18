//
//  SIPropertiesAndSubscriptsExample.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/18/15.
//  Copyright (c) 2015 Applikey Solutions. All rights reserved.
//

import UIKit

// MARK: - Subscripts

class SIHero {
    let name: String
    var power: Float?
    
    init(fullname name:String, power:Float = 1) {
        self.name = name
        self.power = power
    }
}

class SIAvangers {
    var heroes: [SIHero]?
    
    init(heroes: [SIHero]?) {
        self.heroes = heroes
    }
    
    
    subscript(index: Int) -> SIHero? {
        get {
            if index < self.heroes?.count {
                return self.heroes?[index]
            }
            
            return nil
        }
        
        set(newValue) {
            if newValue != nil && index < self.heroes?.count {
                self.heroes?[index] = newValue!
            }
        }
    }
}


// MARK: - Properties

class SISomeMassiveClass {
    //
}

class SIPropertiesAndSubscriptsExample: NSObject {
    // MARK - Lazy properties
    
    lazy var theAvangers: SIAvangers? = self.loadTempData()
    lazy var theAvengers2: Void -> SIAvangers? = { return nil }
    lazy var massiveClass = SISomeMassiveClass()
    
    func loadTempData() -> SIAvangers? {
        let heroes = [SIHero(fullname: "Captain", power: 500.0),
                      SIHero(fullname: "IronMan"),
                      SIHero(fullname: "Hulk", power: 100500.0)]
        
        return SIAvangers(heroes: heroes)
    }
    
    func heroAtIndex(index: Int) -> SIHero? {
        if self.theAvangers != nil {
            return self.theAvangers![index]
        }
        
        return nil
    }
    
    
    // MARK: - Setters observers
    
    var innerSquareSide: Float?
    
    var squareSide: Float = 10.0 {
        willSet {
            self.innerSquareSide = newValue / 2
        }
        
        didSet {
            if self.squareSide > oldValue  {
                print("delta = \(self.squareSide - oldValue)")
            }
        }
    }
    
    var readOnlyProperty: Int {
        return 5
    }
    
    // MARK: - Custom setter
    
    var alwaysPositiveProperty:Int? {
        didSet {
            if self.alwaysPositiveProperty < 0 {
                self.alwaysPositiveProperty = 0
            }
        }
    }
   
}
