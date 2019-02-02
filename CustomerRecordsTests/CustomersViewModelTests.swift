//
//  CustomersViewModelTests.swift
//  CustomerRecordsTests
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import XCTest
@testable import CustomerRecords

class CustomersViewModelTests: XCTestCase {
    
    var dataLoader = MockDataLoader()
    var customersViewModel = CustomersViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        customersViewModel.dataLoader = dataLoader
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLoadDataError() {
        dataLoader.mockCustomers = nil
        dataLoader.mockError = "This is an error"
        
        customersViewModel.loadCustomers()
        
        XCTAssertEqual(customersViewModel.status, dataLoader.mockError)
        XCTAssertEqual(customersViewModel.getCustomersCount(), 0)
    }
    
    func testLoadCustomers() {
        let data = loadDataFromBundle(withName: "customers", extension: "json")
        let customers = try! JSONDecoder().decode([Customer].self, from: data)
        
        dataLoader.mockCustomers = customers
        dataLoader.mockError = nil
        
        customersViewModel.loadCustomers()
        
        XCTAssertEqual(customersViewModel.customerCellViewModels.count, 32)
        XCTAssertEqual(customersViewModel.getCustomersCount(), 16)
        XCTAssertNil(customersViewModel.status)
    }
    
    func testFilterCustomers() {
        let data = loadDataFromBundle(withName: "customers", extension: "json")
        let customers = try! JSONDecoder().decode([Customer].self, from: data)
        let customerCellViewModels = customers.map { (customer) -> CustomerCellViewModel in
            return CustomerCellViewModel(withCustomer: customer)
        }
        
        customersViewModel.customerCellViewModels = customerCellViewModels
        customersViewModel.setOfficeLocation(latitude: 53.339428, longitude: -6.257664)
        
        let maxDistances: [Double] = [100, 75, 50]
        let customersCounts = [16, 10, 8]
        
        for i in 0..<maxDistances.count {
            customersViewModel.maxDistance = maxDistances[i]
            XCTAssertEqual(customersViewModel.getCustomersCount(), customersCounts[i])
        }
    }


}
