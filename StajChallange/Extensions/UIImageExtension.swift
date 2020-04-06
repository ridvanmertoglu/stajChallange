import Foundation
import SVGKit

/*I created this extension to convert  SVGImage to UIImage.*/
extension UIImage {
    func getSVG(imageName: String) -> UIImage {
        
        let svgImage: SVGKImage = SVGKImage(named: imageName)
        let resultImage: UIImage = svgImage.uiImage
        
        return resultImage
    }
}
