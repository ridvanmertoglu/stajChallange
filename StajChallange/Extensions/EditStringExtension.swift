import Foundation

/*I created this extension to arrange the price format which includes 2 digits after the comma. */
extension String{
    
    func editPrice(givenPrice:String) -> String{
        let digitArray = givenPrice.components(separatedBy: ".")
        let editedPrice = digitArray[0] + "." + digitArray[1].prefix(2)
        return editedPrice
    }
}
