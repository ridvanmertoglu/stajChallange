//
//  CoinViewModel.swift
//  StajChallange
//
//  Created by RIDVAN on 4.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import Foundation

struct CoinViewModelState {
    enum Change: StateChange {
        case fetching
        case succeeded
        case failed(message: String?)
    }
}

final class CoinViewModel: StatefulViewModel<CoinViewModelState.Change> {
    
    var coins: Response?
    //var coinArray = [Coin]()
    
    func fetchCoinResults() {
        print("error2")
        let path = "https://api.coinranking.com/v1/public/coins"
        var request = URLRequest(path: path)
        request.setValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "packageName")
        emit(change: .fetching)
        NetworkManager.shared.fetchResponse(request: request) { [weak self] (data, error) in
            if let err = error {
                print("error0")
                self?.emit(change: .failed(message: err.localizedDescription))
                return
            }
            guard let data = data else {
                print("error1")
                self?.emit(change: .failed(message: "Data Boş"))
                return
            }
            print(data.prettyPrintedJSONString!)
            self?.coins = Response.decodeObject(data: data)
            print(self?.coins?.data?.coins?.count ?? 111)
            self?.emit(change: .succeeded)
        }
    }
    }

extension Data {
    var prettyPrintedJSONString: String? {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
            let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
            let prettyPrintedString = String(data: data, encoding: .utf8) else { return nil }
        return prettyPrintedString
    }
}
    

