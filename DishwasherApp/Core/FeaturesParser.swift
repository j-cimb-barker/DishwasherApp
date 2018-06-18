//
//  FeaturesParser.swift
//  DishwasherApp
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

class FeaturesParser: NSObject {

    var jsonDict = [String : Any] ()
    
    override init () {
    }
    
    init (theJsonDict: [String : Any]) {
        super.init()
        
        self.jsonDict = theJsonDict
    }
    
    func getName () -> String {
        
        if jsonDict ["name"] != nil {
            return jsonDict ["name"] as! String
        }
        
        return ""
    }
    
    func getValue () -> String {
        
        var valueStr = ""
        
        if jsonDict ["value"] != nil {
            
            valueStr = jsonDict ["value"] as! String
            
            if valueStr == "YES" {
                valueStr = "Yes"
            }
            
            if valueStr == "NO" {
                valueStr = "No"
            }
        }
        
        return valueStr
    }
    
    
}
