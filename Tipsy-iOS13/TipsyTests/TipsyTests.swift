//
//  TipsyTests.swift
//  TipsyTests
//
//  Created by 강지우 on 2021/10/01.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import XCTest
@testable import Tipsy

class TipsyTests: XCTestCase {
    
    let calculator = Calculator()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSplitCalculator() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let test1 = calculator.calculateSplit(bill: 245, tipPercent: 0.2, splitNum: 5)
        XCTAssertEqual(58.8, test1, "Wrong Answer")
        
        let test2 = calculator.calculateSplit(bill: 555, tipPercent: 0.1, splitNum: 3)
        XCTAssertEqual(203.5, test2, "Wrong Answer")
        
        let test3 = calculator.calculateSplit(bill: 799, tipPercent: 0.0, splitNum: 4)
        XCTAssertEqual(199.75, test3, "Wrong Answer")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
            calculator.calculateSplit(bill: 245, tipPercent: 0.2, splitNum: 5)
            calculator.calculateSplit(bill: 555, tipPercent: 0.1, splitNum: 3)
            calculator.calculateSplit(bill: 799, tipPercent: 0.0, splitNum: 4)
        }
    }

}
