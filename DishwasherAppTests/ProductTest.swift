//
//  ProductTest.swift
//  DishwasherAppTests
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import XCTest

class ProductTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func makeJsonDict () -> [String:Any] {
        
        var jsonDict = [
            
            "title" : "theTitle",
            "productId" : "theProductId",
            "displaySpecialOffer" : "theDisplaySpecialOffer",
            "image" : "//johnlewis.scene7.com/is/image/JohnLewis/234378764?",
            "code" : "12345"
            ] as [String:Any]
        
        jsonDict ["media"] = [
            "360images" : [
                "swfUrl" : "//johnlewis.scene7.com/is/content/JohnLewis/360-degree-view",
                "urls" : []
            ],
            "images" : [
                "altText" : "BuyBosch SMV40C30GB Fully Integrated Dishwasher Online at johnlewis.com",
                "urls" :  [
                    "//johnlewis.scene7.com/is/image/JohnLewis/234378764?",
                    "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt1?",
                    "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt10?",
                    "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt2?",
                    "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt3?",
                    "//johnlewis.scene7.com/is/image/JohnLewis/234378764alt9?"
                ]
            ],
            "videos" : [
            ]
            ] as [String:Any]
        
        jsonDict ["details"] = [
            "productInformation" : "<p>the productInfo</p>",
            "features" : [
                [
                "attributes" : [
                    [
                        "id" : "attr10139380720",
                        "name" : "Model name / number",
                        "toolTip" : "",
                        "uom" : "",
                        "value" : "SMV40C30GB Fully Integrated Dishwasher"
                        ]
                    ]
                ]
            ]
            ]  as [String:Any]
        
        jsonDict ["additionalServices"] = [
            "includedServices" : [
                "2 year guarantee included"
            ]
            ] as [String:Any]
        
        jsonDict ["price"] = [
            "currency" : "GBP",
            "now" : "359.00",
            "then1" : "",
            "then2" : "",
            "uom" : "",
            "was" : ""
            ] as [String:String]
        
        return jsonDict
        
    }
    
    func testBasicItems() {
        
        let jsonDict = self.makeJsonDict()
        let product = Product (jsonDict: jsonDict)
        
        XCTAssert (product.title == "theTitle")
        XCTAssert (product.productId == "theProductId")
        XCTAssert (product.displaySpecialOffer == "theDisplaySpecialOffer")
        XCTAssert (product.code == "12345")
        XCTAssert (product.imageURL?.absoluteString == "https://johnlewis.scene7.com/is/image/JohnLewis/234378764?")
    }
    
    func testGetPrice () {
        
        let jsonDict = self.makeJsonDict()
        let product = Product (jsonDict: jsonDict)
        
        XCTAssert (product.price == "359.00")
    }
    
    func testGetProductInfo () {
        
        let jsonDict = self.makeJsonDict()
        let product = Product (jsonDict: jsonDict)
        
        XCTAssert (product.productInfo == "<p>the productInfo</p>")
    }
    
    func testMediaImages () {
        
        let jsonDict = self.makeJsonDict()
        let product = Product (jsonDict: jsonDict)
        
        let imgs = product.images
        
        XCTAssert(imgs.count > 0)
        XCTAssert(imgs.contains("https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt3?"))
    }
    
    func testGetFeatures () {
        
        let jsonDict = self.makeJsonDict()
        let product = Product (jsonDict: jsonDict)
        
        let features = product.features
        
        XCTAssert(features.count > 0)
        
        var sawFeature = false
        
        for feature in features {
            Logging.JLog(message: "feature : \(feature)")
            
            sawFeature = (feature.name == "Model name / number") && (feature.value == "SMV40C30GB Fully Integrated Dishwasher")
            
        }
        XCTAssert(sawFeature)
    }
    
    func testGetGuarantee () {
        
        let jsonDict = self.makeJsonDict()
        let product = Product (jsonDict: jsonDict)
        
        XCTAssert (product.guaranteeStr == "2 year guarantee included")
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
