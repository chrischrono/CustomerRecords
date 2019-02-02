//
//  DistanceCalculatorTests.swift
//  CustomerRecordsTests
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import XCTest
@testable import CustomerRecords

class DistanceCalculatorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let targetLatLon = [53.339428, -6.257664]
        let locations = [
            [52.986375, -6.043701],
            [51.92893, -10.27699],
            [51.8856167, -10.4240951],
            [52.3191841, -8.5072391],
            [53.807778, -7.714444],
            [54.0894797, -6.18671]
            ]
        let results: [Double] = [42, 313, 324, 189, 109, 84]
        
        for i in 0..<locations.count {
            let latLon = locations[i]
            let distance = round( DistanceCalculator.calculateDistance(latitude1: latLon[0], longitude1: latLon[1], latitude2: targetLatLon[0], longitude2: targetLatLon[1]) )
            XCTAssertEqual(distance, results[i])
        }
    }

}
