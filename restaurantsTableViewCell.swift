//
//  restaurantsTableViewCell.swift
//  Foodpin Practice
//
//  Created by Ayush Verma on 29/04/17.
//  Copyright © 2017 ayush. All rights reserved.
//

import UIKit

class restaurantsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var thumbnaiImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
