//
//  ConvertHtmlTest.swift
//  DishwasherAppTests
//
//  Created by Josh Barker on 18/06/2018.
//  Copyright © 2018 Talking Cucumber Ltd. All rights reserved.
//

import XCTest

class ConvertHtmlTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRemoveHtml() {
        
        let htmlStr = "<p>The HTML Tags should be removed</p>"
        Logging.JLog(message: "htmlStr.html2String : \(htmlStr.html2String)")
        
        XCTAssert(htmlStr.html2String.starts(with: "The HTML Tags should be removed"))
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
