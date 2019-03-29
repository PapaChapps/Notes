//
//  URLQueryHelper.swift
//  FoodPantryMKII
//
//  Created by Makay Chapple on 3/20/19.
//  Copyright © 2019 Makay Chapple. All rights reserved.
//

import Foundation

extension URL {
    func withQueries(_ queries: [String:String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.flatMap {
            URLQueryItem(name: $0.0, value: $0.1)
        }
        return components?.url
    }
}
