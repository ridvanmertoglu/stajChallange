import Foundation
import SVGKit

extension UIImage {
    func getSVG(imageName: String) -> UIImage {
        
        let svgImage: SVGKImage = SVGKImage(named: imageName)
        let resultImage: UIImage = svgImage.uiImage
        
        return resultImage
    }
}
