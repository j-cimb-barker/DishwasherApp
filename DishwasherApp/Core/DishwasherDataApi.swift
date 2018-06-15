//
//  DishwasherDataApi.swift
//  DishwasherApp
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import Foundation

class DishwasherDataApi {
    
    static let shared = DishwasherDataApi ()
    
    func getProduct (productId: String, completionClosure: @escaping (_ product :Product, _ errorStr: String) ->()) {
        
        let urlStr = "https://api.johnlewis.com/v1/products/" + productId + "?key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
    
        
        self.getDataFromApi (urlStr: urlStr) { (dataGot :Dictionary<String, Any>, errorStr: String) in
            
            Logging.JLog(message: "dataGot : \(dataGot)")
            
            let product = Product (jsonDict: dataGot)
            
            /*
            let products = dataGot ["products"] as! [[String:Any]]
            var productsFound = [Product] ()
            
            for productDict in products {
                
                Logging.JLog(message: "productDict : \(productDict)")
                
                let product = Product (jsonDict: productDict)
                
                Logging.JLog(message: "product : \(product.description)")
                
                productsFound.append(product)
            }*/
            
            
            completionClosure(product, errorStr)
        }
        
    }
    
    
    
    func getAllProducts (completionClosure: @escaping (_ products :[Product], _ errorStr: String) ->()) {
    
        let urlStr = "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"
        
        self.getDataFromApi (urlStr: urlStr) { (dataGot :Dictionary<String, Any>, errorStr: String) in

            let products = dataGot ["products"] as! [[String:Any]]
            var productsFound = [Product] ()
            
            for productDict in products {

                Logging.JLog(message: "productDict : \(productDict)")

                let product = Product (jsonDict: productDict)
                
                Logging.JLog(message: "product : \(product.description)")
                
                productsFound.append(product)
            }
            
            
            completionClosure(productsFound, errorStr)
        }
    }
    
    
    // gets json data from the api
    func getDataFromApi (urlStr: String,
                               completionClosure: @escaping (_ dataGot :Dictionary<String, Any>, _ errorStr: String) ->()) {
        
        Logging.JLog(message: "urlStr : \(urlStr)")
        
        URLCache.shared.removeAllCachedResponses()
        
        let url = URL(string: urlStr)
        var urlRequest = URLRequest (url: url!)
        urlRequest.cachePolicy = .reloadIgnoringCacheData
        
        let session = URLSession.shared
        
        let returnDict = [String:Any]();
        
        var errorStr = ""
        
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                Logging.JLog(message: "error...!")
                Logging.JLog(message: error.debugDescription)
                
                errorStr = (error?.localizedDescription)!
                
                completionClosure(returnDict, errorStr)
                return;
            }
            // make sure we got data
            guard let responseData = data else {
                Logging.JLog(message: "Error: did not receive data")
                
                errorStr = "No data returned from server."
                completionClosure(returnDict, errorStr)
                return
            }
            
            Logging.JLog(message: "responseData : \(responseData)")
            
            let jsonStr = String(data: responseData, encoding: .utf8)
            
            Logging.JLog(message: "jsonStr : \(jsonStr!)")
            
            // should be json...
            do {
                
                let jsonObj = try JSONSerialization.jsonObject(with: responseData, options: [])
                
                var jsonDict = [String : Any]()
                
                if let jsonArray = jsonObj as? [[String : Any]] {
                    
                    // its an array...
                    if jsonArray.count == 0 {
                        
                        Logging.JLog(message: "invalid response")
                        errorStr = "Server returned invalid response."
                        completionClosure(returnDict, errorStr)
                    }
                    
                    jsonDict = jsonArray[0]
                    
                } else {
                    // or a dict
                    jsonDict = (jsonObj as? [String : Any])!
                }
                
                Logging.JLog(message: "jsonDict : \(jsonDict)")
                completionClosure(jsonDict, errorStr)
            } catch  {
                print("error trying to convert data to JSON")
                completionClosure(returnDict, errorStr)
            }
        }
        task.resume()
    }
    
}
