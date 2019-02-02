//
//  DataLoader.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation



protocol DataLoader {
    func loadCustomer(completion: @escaping ((_ customers: [Customer]?, _ error: String?)->()))
}


class FileDataLoader: DataLoader {
    func loadCustomer(completion: @escaping (([Customer]?, String?) -> ())) {
        DispatchQueue.global(qos: .utility).async { [weak self] in
            self?.loadCustomerFromFile("customers", completion: completion)
        }
    }
    
    private func loadCustomerFromFile(_ filename: String, completion: (([Customer]?, String?) -> ())) {
        guard let data = loadDataFromBundle(withName: "customers", extension: "txt")  else {
            completion(nil, "load_file_error".localized())
            return
        }
        
        guard let customersString = String(data: data, encoding: .utf8) else {
            completion(nil, "load_file_not_string".localized())
            return
        }
        
        parseCustomersString(customersString, completion: completion)
    }
    
    private func parseCustomersString(_ customersString: String, completion: (([Customer]?, String?) -> ())) {
        let customersList = customersString.components(separatedBy: "\n")
        
        let customers = customersList.compactMap({(customerString)->Customer? in
            guard let data = customersString.data(using: .utf8) else {
                return nil
            }
            return try? JSONDecoder().decode(Customer.self, from: data)
        })
        
        let error: String? = customersList.count > customers.count ? "parse_customer_string_error".localized() : nil
        completion(customers, error)
    }
    
    private func loadDataFromBundle(withName name: String, extension: String) ->  Data? {
        let bundle = Bundle.main
        if let url = bundle.url(forResource: name, withExtension: `extension`) {
            let data = try? Data(contentsOf: url)
            return data
        }
        return nil
    }
}


