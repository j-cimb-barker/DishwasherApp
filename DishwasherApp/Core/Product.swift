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
    
    var images = [String] ()
    var details = [String:Any] ()
    var additionalServices = [String:Any] ()
    var code = ""
    var features = [[String:Any]] ()
    
    var displaySpecialOffer = ""
    var guranteeStr = ""
    var productInfo = ""
    
    override init () {
    }
 
    init (jsonDict: [String : Any]) {
        
        super.init()
        
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
            processImgData(imgData: jsonDict ["media"] as! [String:Any])
        }
        
        if jsonDict ["displaySpecialOffer"] != nil {
            self.displaySpecialOffer = jsonDict ["displaySpecialOffer"] as! String
        }
        
        if jsonDict ["code"] != nil {
            self.code = jsonDict ["code"] as! String
        }
        
        if jsonDict ["details"] != nil {
            let detailInfo = jsonDict ["details"] as! [String:Any]
            self.details = detailInfo
            self.features = detailInfo ["features"] as! [[String:Any]]
        }
        
        if jsonDict ["additionalServices"] != nil {
            
            if jsonDict ["additionalServices"] is Dictionary<String,Any>  {
                self.processAdditionInfo(additionalInfo: jsonDict ["additionalServices"] as! [String:Any])
            }
        }
    }
    
    func processAdditionInfo (additionalInfo: Dictionary<String,Any>) {
        
        let includedServices = additionalInfo ["includedServices"] as! [String]
        if includedServices.count > 0 {
            self.guranteeStr = includedServices[0]
        }
        
    }
    
    func processImgData (imgData: Dictionary<String,Any>) {
        
        let prodImages = imgData ["images"] as! [String:Any]
        
        Logging.JLog(message: "prodImages : \(prodImages)")
        
        let prodImgArray = prodImages ["urls"] as! [String]
        
        for prodImg in prodImgArray {
            Logging.JLog(message: "prodImg : \(prodImg)")
            
            let fullImg = "https:" + prodImg
            self.images.append(fullImg)
        }
        
    }
    
    override var description : String {
        
        var descrStr = "productId : \(productId), title : \(title), priceDict : \(priceDict)"
        
        descrStr = descrStr + ", images : \(images), details : \(details)"
        descrStr = descrStr + ", additionalServices : \(additionalServices), features : \(features)"
        descrStr = descrStr + ", code : \(code)"
        
        return descrStr
    }
    
    
}
