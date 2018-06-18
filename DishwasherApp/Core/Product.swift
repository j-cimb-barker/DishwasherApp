//
//  Product.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import Foundation

class Product: NSObject {
    
    var productId = ""
    var price = "n/a"
    var title = ""
    
    var imageURL: URL?
    
    var images = [String] ()

    var code = ""
    
    var displaySpecialOffer = ""
    var guaranteeStr = ""
    var productInfo = ""
    
    var features = [Feature] ()
    
    override init () {
    }
 
    init (jsonDict: [String : Any]) {
        
        super.init()
        
        let parser = ProductParser (theJsonDict: jsonDict)

        self.title = parser.getTitle()
        
        self.productId = parser.getProductId()
        self.price = parser.getPrice()
        self.productInfo = parser.getProductInfo()
        
        let imageUrlStr = parser.getImageUrlStr()
        
        if imageUrlStr != "" {
            self.imageURL = URL.init(string: imageUrlStr)
        }
        
        self.images = parser.getImages()
        
        self.displaySpecialOffer = parser.getSpecialOffer()
        
        self.code = parser.getProductCode()
        
        self.features = parser.getFeatures()
        
        self.guaranteeStr = parser.getGuarenteeStr()
        
        
    }
    
    
    override var description : String {
        
        var descrStr = "productId : \(productId), title : \(title), price : \(price)"
        
        descrStr = descrStr + ", images : \(images)"
        descrStr = descrStr + ", features : \(features)"
        descrStr = descrStr + ", code : \(code)"
        
        return descrStr
    }
    
    
}
