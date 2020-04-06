import Foundation

/* I created this extension to decode datas from API to my model.*/
extension Decodable {
    static func decodeObject<T: Decodable>(data: Data?) -> T? {
        guard let data = data else { return nil }
        let object = try? JSONDecoder().decode(T.self, from: data)
        return object
    }
}
