//
//  ProductParser.swift
//  DishwasherApp
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import UIKit

class ProductParser: NSObject {

    var jsonDict = [String : Any] ()
    
    override init () {
    }
    
    init (theJsonDict: [String : Any]) {
        super.init()
        
        self.jsonDict = theJsonDict
    }
    
    // unit tested in ProdutParserTest
    func getTitle () -> String {
        return jsonDict ["title"] as! String
    }

    // unit tested in ProdutParserTest
    func getProductId () -> String {
        
        var productId = ""
        
        if jsonDict ["productId"] != nil {
            productId = jsonDict ["productId"] as! String
        }
        
        return productId
    }

    // unit tested in ProdutParserTest
    func getPrice () -> String {
        return self.processPrice(priceDict: jsonDict ["price"] as! [String:String])
    }
    
    // unit tested in ProdutParserTest
    func getImageUrlStr () -> String {
        
        var imageUrlStr = ""
        
        if jsonDict ["image"] != nil {
            let imgStr = jsonDict ["image"] as! String
            imageUrlStr = "https:" + imgStr
        }
        
        return imageUrlStr
    }
    
    // unit tested in ProdutParserTest
    func getImages () -> [String] {
        
        var images = [String] ()
        
        if jsonDict ["media"] != nil {
            images = processImgData(imgData: jsonDict ["media"] as! [String:Any])
        }
        
        return images
    }
    
    // unit tested in ProdutParserTest
    func getSpecialOffer () -> String {
        
        if jsonDict ["displaySpecialOffer"] != nil {
            return jsonDict ["displaySpecialOffer"] as! String
        }
        
        return ""
    }
    
    // unit tested in ProdutParserTest
    func getProductCode () -> String {
        
        if jsonDict ["code"] != nil {
           return jsonDict ["code"] as! String
        }
        
        return ""
    }
    
    // unit tested in ProdutParserTest
    func getFeatures () -> [Feature] {
        
        var features = [Feature] ()
        
        if jsonDict ["details"] != nil {
            let detailInfo = jsonDict ["details"] as! [String:Any]
            
            
            
            let featuresArray = detailInfo ["features"] as! [[String:Any]]
            
            let featuresArrayFirst = featuresArray.first
            
            
            let allFeatures = featuresArrayFirst! ["attributes"] as! [[String:Any]]
            print (allFeatures)
            
            features = self.processFeatures(featuresArray: allFeatures)
            Logging.JLog(message: "features.count : \(features.count)")
        }
        
        return features
    }
    
    // unit tested in ProdutParserTest
    func getGuarenteeStr () -> String {
        
        if jsonDict ["additionalServices"] != nil {
            
            if jsonDict ["additionalServices"] is Dictionary<String,Any>  {
                return self.processAdditionalInfo(additionalInfo: jsonDict ["additionalServices"] as! [String:Any])
            }
        }
        
        return ""
    }
    
    
    func processPrice (priceDict: Dictionary<String,String>) -> String {
        
        if priceDict ["now"] != nil {
            return priceDict ["now"]!
        }
        
        return "n/a"
        
    }
    
    func processFeatures (featuresArray: Array<Dictionary<String,Any>>) -> [Feature] {
        
        var features = [Feature] ()
        
        for featureDict in featuresArray {
            let feature = Feature (jsonDict: featureDict)
            features.append(feature)
        }
        
        return features
    }
    
    func processAdditionalInfo (additionalInfo: Dictionary<String,Any>) -> String {
        
        let includedServices = additionalInfo ["includedServices"] as! [String]
        if includedServices.count > 0 {
            return includedServices[0]
        }
        
        return ""
    }
    
    // unit tested in ProdutParserTest
    func processImgData (imgData: Dictionary<String,Any>) -> [String] {
        
        var images = [String] ()
        
        let prodImages = imgData ["images"] as! [String:Any]
        
        Logging.JLog(message: "prodImages : \(prodImages)")
        
        let prodImgArray = prodImages ["urls"] as! [String]
        
        for prodImg in prodImgArray {
            Logging.JLog(message: "prodImg : \(prodImg)")
            
            let fullImg = "https:" + prodImg
            images.append(fullImg)
        }
        
        return images
        
    }
    
}
