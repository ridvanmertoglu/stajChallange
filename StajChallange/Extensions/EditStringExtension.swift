//
//  EditStringExtension.swift
//  StajChallange
//
//  Created by RIDVAN on 5.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import Foundation

extension String{
    func editPrice(givenPrice:String) -> String{
        let digitArray = givenPrice.components(separatedBy: ".")
        let editedPrice = digitArray[0] + "." + digitArray[1].prefix(2)
        return editedPrice
    }
}
