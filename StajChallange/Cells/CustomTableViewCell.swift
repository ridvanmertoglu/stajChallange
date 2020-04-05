//
//  CustomTableViewCell.swift
//  StajChallange
//
//  Created by RIDVAN on 5.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var customCellImage: UIImageView!
    @IBOutlet weak var customCellNameLabel: UILabel!
    @IBOutlet weak var customCellPriceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
