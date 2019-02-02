//
//  CustomerViewCell.swift
//  CustomerRecords
//
//  Created by Christian  Huang on 02/02/19.
//  Copyright © 2019 Christian Huang. All rights reserved.
//

import UIKit

class CustomerViewCell: UITableViewCell {
    
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(with viewModel: CustomerCellViewModel){
        idLabel.text = "\(viewModel.userId)"
        nameLabel.text = String(format: "%@ (%.2f)", viewModel.name, viewModel.distance)
    }
}
