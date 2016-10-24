//
//  PiedPiperTests.swift
//  PiedPiperTests
//
//  Created by Pavel Prochazka on 22/10/2016.
//  Copyright © 2016 MobileLife. All rights reserved.
//

import XCTest
@testable import PiedPiper

class PiedPiperTests: XCTestCase {
    
    let viewModel = CalculationViewModel()
    
    func testAddition() {
        let result = try! self.viewModel.perform(operation: .addition, on: 1, and: 1)
        XCTAssertEqual(result, 2)
    }
    
    func testSubstraction() {
        let result = try! self.viewModel.perform(operation: .subtraction, on: 10, and: 5)
        XCTAssertEqual(result, 5)
    }
    
    func testMultiplication() {
        let result = try! self.viewModel.perform(operation: .multiplication, on: 10, and: 5)
        XCTAssertEqual(result, 50)
    }
    
    func testDivision() {
        let result = try! self.viewModel.perform(operation: .division, on: 10, and: 5)
        XCTAssertEqual(result, 2)
    }
    
    func testDivisionByZero() {
        XCTAssertThrowsError(try self.viewModel.perform(operation: .division, on: 10, and: 0))
    }
}
