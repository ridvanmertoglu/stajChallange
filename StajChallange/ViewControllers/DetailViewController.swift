//
//  DetailViewController.swift
//  StajChallange
//
//  Created by RIDVAN on 5.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import UIKit
import SVGKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    var selectedName = ""
    var selectedPrice = ""
    var selectedDescription = ""
    var selectedSymbol = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = selectedSymbol
        descriptionView.text = selectedDescription
        imageView.image = UIImage().getSVG(imageName: selectedName)
        nameLabel.text = selectedName
        priceLabel.text = selectedPrice
        
    }
    
    
    

    

}
