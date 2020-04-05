//
//  URLRequestExtension.swift
//  StajChallange
//
//  Created by RIDVAN on 4.04.2020.
//  Copyright © 2020 ridvanmertoglu. All rights reserved.
//

import Foundation


extension URLRequest {
    init(path: String) {
        let url = URL(string: path)
        self = URLRequest(url: url!,
                          cachePolicy: .useProtocolCachePolicy,
                          timeoutInterval: 10.0)
        httpMethod = "GET"
        
    }
}
