//
//  StringExtension.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation

extension String {
    
    func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
