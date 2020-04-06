import UIKit

typealias ServiceResponseBlock = (Data?, Error?) -> Void

final class NetworkManager {

    static let shared = NetworkManager()
    
    private init() {}
    /*I created this function to connect API and fetch datas from API.*/
    func fetchResponse(request: URLRequest, completion: ServiceResponseBlock?) {
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let err = error,
                data != nil {
                completion?(nil, err)
                return
            }
            completion?(data, nil)
        }.resume()
    }
}
