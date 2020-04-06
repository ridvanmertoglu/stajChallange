//
//  CustomTableViewCell.swift
//  StajChallange
//
//  Created by RIDVAN on 6.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var customCellImage: UIImageView!
    @IBOutlet weak var customCellSymbolLabel: UILabel!
    @IBOutlet weak var customCellPriceLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
