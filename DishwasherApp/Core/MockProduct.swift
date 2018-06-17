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
        
        super.productId = "3215462"
        super.title = "Bosch SMS25AW00G Freestanding Dishwasher, White"
        
        super.priceDict = [
            "was": "",
            "then1": "",
            "then2": "",
            "now": "239.00",
            "uom": "",
            "currency": "GBP"
        ]
        
        super.imageURL = URL.init(string: "https://johnlewis.scene7.com/is/image/JohnLewis/236888507?")
        
        super.images = [
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764?",
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt1?",
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt10?",
            "https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt2?",
        ]
        
        
        
    }
    
}
