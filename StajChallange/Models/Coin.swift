import Foundation

final class Response: Decodable {
    var status: String?
    var data: CoinData?
}

final class CoinData: Decodable {
    var coins: [Coin]?
}

final class Coin: Decodable {
    var color: String?
    var name: String?
    var iconUrl: String?
    var symbol: String?
    var description: String?
    var price: String?
    var history: [String]?
}
