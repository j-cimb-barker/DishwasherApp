//
//  MockProduct.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import Foundation

// Mock Product for UI Development / Testing
class MockProduct : Product {
    
    
    override init () {
        
        super.init()
        
        super.productId = "12345678"
        super.title = "Mock Product"
        
        super.priceDict = [
            "was": "",
            "then1": "",
            "then2": "",
            "now": "239.00",
            "uom": "",
            "currency": "GBP"
        ]
        
        super.imageURL = URL.init(string: "https://johnlewis.scene7.com/is/image/JohnLewis/236888507?")
        
        
    }
    
}
