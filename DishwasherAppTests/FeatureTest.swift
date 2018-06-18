//
//  FeatureTest.swift
//  DishwasherAppTests
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import XCTest

class FeatureTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJsonInit() {
        
        let feature = Feature (jsonDict: [
            "id" : "attr10139380720",
            "name" : "Model name / number",
            "toolTip" : "",
            "uom" : "",
            "value" : "SMV40C30GB Fully Integrated Dishwasher"
            ])
        
        XCTAssert(feature.name == "Model name / number")
        XCTAssert(feature.value == "SMV40C30GB Fully Integrated Dishwasher")
    }
    
    func testUpperCaseYes() {
        
        let feature = Feature (jsonDict: [
            "id" : "attr10139380720",
            "name" : "Rinse Aid Indicator",
            "toolTip" : "",
            "uom" : "",
            "value" : "YES"
            ])
        
        XCTAssert(feature.name == "Rinse Aid Indicator")
        XCTAssert(feature.value == "Yes")
    }
    
    func testUpperCaseNo() {
        
        let feature = Feature (jsonDict: [
            "id" : "attr10139380720",
            "name" : "Rinse Aid Indicator",
            "toolTip" : "",
            "uom" : "",
            "value" : "NO"
            ])
        
        XCTAssert(feature.name == "Rinse Aid Indicator")
        XCTAssert(feature.value == "No")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
