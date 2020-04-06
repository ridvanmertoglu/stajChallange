import Foundation

extension String{
    
    func editPrice(givenPrice:String) -> String{
        let digitArray = givenPrice.components(separatedBy: ".")
        let editedPrice = digitArray[0] + "." + digitArray[1].prefix(2)
        return editedPrice
    }
}
