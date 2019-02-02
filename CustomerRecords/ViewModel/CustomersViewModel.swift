//
//  CustomersViewModel.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import Foundation


class CustomersViewModel {
    private var customers = [Customer]()
    var customerCellViewModels: [CustomerCellViewModel] = [] {
        didSet {
            reloadCustomersTableViewClosure?()
        }
    }
    
    var reloadCustomersTableViewClosure: (()->())?
    
    var status: String?
    
    var dataLoader = FileDataLoader()
    
    var officeLatitude = 53.339428
    var officeLongitude = -6.257664
    var maxDistance = 100
}

//MARK:- public func
extension CustomersViewModel {
    func loadData() {
        status = "load_data_loading".localized()
        reloadCustomersTableViewClosure?()
        dataLoader.loadCustomer { [weak self] (customers, error) in
            guard let self = self else {
                return
            }
            self.status = error
            
            self.processCustomers(customers)
        }
    }
}

//MARK:- private func
extension CustomersViewModel {
    private func processCustomers(_ customers: [Customer]?){
        if let customers = customers {
            self.customers = customers.sorted(by: { $0.userId < $1.userId })
        } else {
            self.customers = [Customer]()
        }
        
        customerCellViewModels = self.customers.map({ (customer)->CustomerCellViewModel in
            return CustomerCellViewModel(withCustomer: customer)
        })
    }
}


