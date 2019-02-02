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
    private var customerCellViewModels: [CustomerCellViewModel] = []
    private var filteredCustomerViewModels: [CustomerCellViewModel] = [] {
        didSet {
            reloadCustomersTableViewClosure?()
        }
    }
    
    var reloadCustomersTableViewClosure: (()->())?
    
    var status: String?
    var isLoading = false
    var dataLoader = FileDataLoader()
    
    private var officeLatitude = 53.339428
    private var officeLongitude = -6.257664
    var maxDistance: Double = 100 {
        didSet {
            filterCustomers()
        }
    }
}

//MARK:- public func
extension CustomersViewModel {
    func loadData() {
        guard isLoading == false && customers.count == 0 else {
            return
        }
        
        isLoading = true
        status = "load_data_loading".localized()
        reloadCustomersTableViewClosure?()
        dataLoader.loadCustomer { [weak self] (customers, error) in
            guard let self = self else {
                return
            }
            self.isLoading = false
            self.status = error
            
            self.processCustomers(customers)
        }
    }
    
    func getCustomersCount() -> Int {
        return filteredCustomerViewModels.count
    }
    
    func getCustomerCellViewModel(forIndex index: Int) -> CustomerCellViewModel{
        return filteredCustomerViewModels[index]
    }
    
    func setOfficeLocation(latitude: Double, longitude: Double) {
        officeLatitude = latitude
        officeLongitude = longitude
        calculateCustomersDistance()
        filterCustomers()
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
        
        customerCellViewModels = self.customers.map({ (customer) -> CustomerCellViewModel in
            let customerCellViewModel = CustomerCellViewModel(withCustomer: customer)
            return customerCellViewModel
        })
        
        calculateCustomersDistance()
        filterCustomers()
    }
    
    private func calculateCustomersDistance() {
        for customerCellViewModel in customerCellViewModels {
            customerCellViewModel.setDistanceFrom(targetLatitude: officeLatitude, targetLongitude: officeLongitude)
        }
    }
    
    private func filterCustomers() {
        filteredCustomerViewModels = customerCellViewModels.filter({ return $0.distance <= maxDistance })
    }
}


