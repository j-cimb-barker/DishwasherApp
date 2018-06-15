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
    var priceDict = [String:String] ()
    var title = ""
    
    var imageURL: URL?
    
    var media = [String:Any] ()
    var details = [String:Any] ()
    var additionalServices = [String:Any] ()
    var code = ""
    var features = [[String:Any]] ()
    
    
    override init () {
    }
 
    init (jsonDict: [String : Any]) {
        
        self.title = jsonDict ["title"] as! String
        
        if jsonDict ["productId"] != nil {
            self.productId = jsonDict ["productId"] as! String
        }

        self.priceDict = jsonDict ["price"] as! [String:String]
        
        if jsonDict ["image"] != nil {
            let imgStr = jsonDict ["image"] as! String
            self.imageURL = URL.init(string: "https:" + imgStr)
        }
        
        if jsonDict ["media"] != nil {
            self.media = jsonDict ["media"] as! [String:Any]
        }
        
        if jsonDict ["code"] != nil {
            self.code = jsonDict ["code"] as! String
        }
        
        if jsonDict ["details"] != nil {
            self.details = jsonDict ["details"] as! [String:Any]
        }
        
        if jsonDict ["additionalServices"] != nil {
            self.additionalServices = jsonDict ["additionalServices"] as! [String:Any]
        }
        
        if jsonDict ["features"] != nil {
            self.features = jsonDict ["features"] as! [[String:Any]]
        }
        
    }
   
    
    override var description : String {
        
        var descrStr = "productId : \(productId), title : \(title), priceDict : \(priceDict)"
        
        descrStr = descrStr + ", media : \(media), details : \(details)"
        descrStr = descrStr + ", additionalServices : \(additionalServices), features : \(features)"
        descrStr = descrStr + ", code : \(code)"
        
        return descrStr
    }
    
    
}
