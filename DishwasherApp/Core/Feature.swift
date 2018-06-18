//
//  Feature.swift
//  DishwasherApp
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

class Feature: NSObject {

    var name = "Unknown"
    var value = "n/a"
    
    override init () {
    }
    
    init (jsonDict: [String : Any]) {
        super.init()
        
        let parser = FeaturesParser (theJsonDict: jsonDict)
        
        self.name = parser.getName()
        self.value = parser.getValue()
    }
    
   
}
