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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}



extension CustomersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "statusCellIdentifier", for: indexPath)
    }
}

