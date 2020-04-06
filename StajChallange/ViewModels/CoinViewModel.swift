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
    
    func fetchCoinResults() {
        let path = "https://api.coinranking.com/v1/public/coins"
        var request = URLRequest(path: path)
        request.setValue(Bundle.main.bundleIdentifier ?? "", forHTTPHeaderField: "packageName")
        emit(change: .fetching)
        NetworkManager.shared.fetchResponse(request: request) { [weak self] (data, error) in
            if let err = error {
                self?.emit(change: .failed(message: err.localizedDescription))
                return
            }
            guard let data = data else {
                self?.emit(change: .failed(message: "Data is empty."))
                return
            }
            self?.coins = Response.decodeObject(data: data)
            self?.emit(change: .succeeded)
        }
    }
    }

    

