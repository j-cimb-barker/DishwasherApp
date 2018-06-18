//
//  ProductParserTest.swift
//  DishwasherAppTests
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import XCTest

class ProductParserTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testBasicItems() {
        
        let jsonDict = [
        
            "title" : "theTitle",
            "productId" : "theProductId",
            "displaySpecialOffer" : "theDisplaySpecialOffer"
        ] as [String:Any]
        
        let parser = ProductParser (theJsonDict: jsonDict)
        
        XCTAssert (parser.getTitle() == "theTitle")
        XCTAssert (parser.getProductId() == "theProductId")
        XCTAssert (parser.getSpecialOffer() == "theDisplaySpecialOffer")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
