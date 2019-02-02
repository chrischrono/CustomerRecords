//
//  CustomersViewController.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 01/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import UIKit

class CustomersViewController: UIViewController {
    
    @IBOutlet private weak var customersTableView: UITableView!
    
    let customersViewModel = CustomersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        initViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        customersViewModel.loadData()
    }

}

//MARK:- ViewModel related
extension CustomersViewController{
    private func initViewModel() {
        customersViewModel.reloadCustomersTableViewClosure = { [weak self] in
            DispatchQueue.main.async {
                self?.customersTableView.reloadData()
            }
        }
    }
}


//MARK:- UITableViewDataSource
extension CustomersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = customersViewModel.getCustomersCount()
        return customersViewModel.status == nil ? count : (count + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var index = indexPath.row
        if let status = customersViewModel.status {
            index -= 1
            if index < 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "StatusCellIdentifier", for: indexPath)
                cell.textLabel?.text = status
                return cell
            }
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerCellIdentifier", for: indexPath) as! CustomerViewCell
        cell.configureCell(with: customersViewModel.getCustomerCellViewModel(forIndex: index))
        return cell
    }
}

