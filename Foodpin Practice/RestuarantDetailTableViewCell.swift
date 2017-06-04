//
//  RestuarantDetailViewCell.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 05/06/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class RestuarantDetailTableViewCell: UITableViewCell {
    
    @IBOutlet var fieldLabel: UILabel!
    @IBOutlet var valueLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
