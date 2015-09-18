//
//  SIOtherExamplesController.swift
//  SwiftIntroduction
//
//  Created by iOS Developer on 9/18/15.
//  Copyright © 2015 Applikey Solutions. All rights reserved.
//

import UIKit

class SIOtherExamplesController: SIBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let propertiesDemo = SIPropertiesAndSubscriptsExample()
        let hero1 = propertiesDemo.heroAtIndex(0)
        let hero2 = propertiesDemo.heroAtIndex(3)
        print(hero1?.name)
        print(hero2?.name)
        
        propertiesDemo.alwaysPositiveProperty = -5
        
    }

}
