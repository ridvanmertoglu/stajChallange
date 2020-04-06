import Foundation

/*I created this extension to connect API.*/
extension URLRequest {
    init(path: String) {
        let url = URL(string: path)
        self = URLRequest(url: url!,
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
        httpMethod = "GET"
    }
}
