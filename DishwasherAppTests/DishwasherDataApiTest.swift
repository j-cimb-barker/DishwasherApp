//
//  DishwasherDataApiTest.swift
//  DishwasherAppTests
//
//  Created by Josh Barker on 15/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import XCTest

class DishwasherDataApiTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testGetProduct () {

        let exp = expectation(description: "some data found")
        
        let productId = "1955287"
        
        DishwasherDataApi.shared.getProduct (productId: productId) { (product :Product, errorStr: String) in
            
            Logging.JLog(message: "errorStr : \(errorStr)")
            Logging.JLog(message: "product : \(product.description)")
            
            XCTAssert(errorStr == "")
            
            
            
            exp.fulfill()
            
        }
        
        
        waitForExpectations(timeout: 20) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
        
    }
    
    func testGetProducts () {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let exp = expectation(description: "some data found")
        
        
        
        DishwasherDataApi.shared.getAllProducts { (products :[Product], errorStr: String) in
            
            Logging.JLog(message: "errorStr : \(errorStr)")
            Logging.JLog(message: "products : \(products)")
            
            XCTAssert(errorStr == "")
            
            XCTAssert(products.count == 20)
            
            exp.fulfill()
            
        }
        
        waitForExpectations(timeout: 20) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
