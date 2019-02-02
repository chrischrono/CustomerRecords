//
//  MockDataLoader.swift
//  CustomerRecordsTests
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation
@testable import CustomerRecords


class MockDataLoader: DataLoader {
    
    var mockCustomers: [Customer]?
    var mockError: String?
    
    func loadCustomers(completion: @escaping (([Customer]?, String?) -> ())) {
        completion(mockCustomers, mockError)
    }
}
