//
//  Customer.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation


struct Customer: Codable {
    let userId: String
    let name: String
    let longitudeString: String
    var longitude: Double {
        return Double(longitudeString) ?? 0
    }
    let latitudeString: String
    var latitude: Double {
        return Double(latitudeString) ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case name
        case longitudeString = "longitude"
        case latitudeString = "latitude"
    }
}
