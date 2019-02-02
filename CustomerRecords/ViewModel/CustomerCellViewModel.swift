//
//  CustomerCellViewModel.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation


class CustomerCellViewModel {
    let userId: String
    let name: String
    let longitude: Double
    let latitude: Double
    var distance: Double = 0
    
    init(withCustomer customer:Customer) {
        userId = customer.userId
        name = customer.name
        longitude = customer.longitude
        latitude = customer.latitude
    }
    
    func setDistanceFrom(targetLatitude: Double, targetLongitude: Double) {
        distance = DistanceCalculator.calculateDistance(latitude1: latitude, longitude1: longitude, latitude2: targetLatitude, longitude2: targetLongitude)
    }
}
