//
//  FeatureParserTest.swift
//  DishwasherAppTests
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import XCTest

class FeatureParserTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testGetName () {
        
        let jsonDict = [
            "id" : "attr10139380720",
            "name" : "Model name / number",
            "toolTip" : "",
            "uom" : "",
            "value" : "SMV40C30GB Fully Integrated Dishwasher"
            ]
        
        let featureParser = FeatureParser (theJsonDict: jsonDict)
        
        XCTAssert(featureParser.getName() == "Model name / number")
        XCTAssert(featureParser.getValue() == "SMV40C30GB Fully Integrated Dishwasher")
    }
    
    func testUpperCaseYes() {
        
        let jsonDict = [
            "id" : "attr10139380720",
            "name" : "Rinse Aid Indicator",
            "toolTip" : "",
            "uom" : "",
            "value" : "YES"
            ]
        
        let featureParser = FeatureParser (theJsonDict: jsonDict)

        
        XCTAssert(featureParser.getName() == "Rinse Aid Indicator")
        XCTAssert(featureParser.getValue() == "Yes")
    }
    
    func testUpperCaseNo() {
        
        let jsonDict = [
            "id" : "attr10139380720",
            "name" : "Rinse Aid Indicator",
            "toolTip" : "",
            "uom" : "",
            "value" : "NO"
        ]
        
        let featureParser = FeatureParser (theJsonDict: jsonDict)
        
        XCTAssert(featureParser.getName()  == "Rinse Aid Indicator")
        XCTAssert(featureParser.getValue() == "No")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
