//
//  Coin.swift
//  StajChallange
//
//  Created by RIDVAN on 4.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

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
}
