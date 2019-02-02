//
//  DistanceCalculator.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation


class DistanceCalculator {
    static let earthRadius: Double = 6371
    
    static func calculateDistance(latitude1: Double, longitude1: Double, latitude2: Double, longitude2: Double) -> Double {
        let phi1 = degreesToRadians(latitude1)
        let phi2 = degreesToRadians(latitude2)
        let deltaLambda = degreesToRadians(longitude2 - longitude1)
        
        let part1 = cos(phi2) * sin(deltaLambda)
        let part2 = cos(phi1) * sin(phi2) - sin(phi1) * cos(phi2) * cos(deltaLambda)
        let part3 = sin(phi1) * sin(phi2) + cos(phi1) * cos(phi2) * cos(deltaLambda)
        
        let deltaSigma = atan( sqrt(part1 * part1 + part2 * part2) / part3 )
        return earthRadius * deltaSigma
    }
    
    static func degreesToRadians(_ degree: Double) -> Double {
        return degree * Double.pi / 180
    }
}
