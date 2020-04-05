//
//  UIImageExtension.swift
//  StajChallange
//
//  Created by RIDVAN on 5.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import Foundation
import SVGKit

extension UIImage {
    func getSVG(imageName: String) -> UIImage {
        let namSvgImgVar: SVGKImage = SVGKImage(named: imageName)
        //let namSvgImgVyuVar = SVGKImageView(svgkImage: namSvgImgVar)
        
        let namImjVar: UIImage = namSvgImgVar.uiImage
        return namImjVar
    }
}
