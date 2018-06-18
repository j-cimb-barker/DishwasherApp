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
            
            
            XCTAssert (product.title == "Bosch SMV40C30GB Fully Integrated Dishwasher")
            XCTAssert (product.productId == "1955287")
            XCTAssert (product.displaySpecialOffer == "")
            XCTAssert (product.code == "88701207")
            XCTAssert (product.price == "359.00")
            
            // images
            XCTAssert(product.images.count > 0)
            XCTAssert(product.images.contains("https://johnlewis.scene7.com/is/image/JohnLewis/234378764alt9?"))

            // guarantee
            XCTAssert(product.guaranteeStr == "2 year guarantee included")
            
            Logging.JLog(message: "product.displaySpecialOffer : \(product.displaySpecialOffer)")
            
            XCTAssert(product.productInfo.starts(with: "<p>The Bosch SMV40C30GB built-in dishwasher features a range of programmes to choose from"))
            
            // features
            let features = product.features
            
            XCTAssert(features.count == 32)
            
            var sawFeature = false
            
            for feature in features {
                Logging.JLog(message: "feature : \(feature.description)")
                
                if !sawFeature {
                    sawFeature = (feature.name == "Energy Consumption Per Standard Cycle") && (feature.value == "1.02kWh")
                }
                
            }
            
            
            
            
            
            
            
            exp.fulfill()
            
        }
        
        
        waitForExpectations(timeout: 20) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
        
    }
    
    func testGetProducts () {
        let exp = expectation(description: "some data found")
        
        DishwasherDataApi.shared.getAllProducts { (products :[Product], errorStr: String) in
            
            Logging.JLog(message: "errorStr : \(errorStr)")
            Logging.JLog(message: "products : \(products)")
            
            XCTAssert(errorStr == "")
            
            XCTAssert(products.count == 20)
            
            exp.fulfill()
            
            var gotProductWanted = false
            
            for product in products {
                
                // check the product details were retreived ok
                if product.productId == "1955287" {
                    gotProductWanted = true
                    
                    XCTAssert (product.title == "Bosch SMV40C30GB Fully Integrated Dishwasher")
                    XCTAssert (product.productId == "1955287")
                    XCTAssert (product.price == "359.00")
                    XCTAssert (product.imageURL?.absoluteString == "https://johnlewis.scene7.com/is/image/JohnLewis/234378764?")
                }
            }
            
            XCTAssert(gotProductWanted)
            
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
