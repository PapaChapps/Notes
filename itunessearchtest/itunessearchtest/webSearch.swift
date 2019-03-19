//
//  webSearch.swift
//  itunessearchtest
//
//  Created by Makay Chapple on 12/4/18.
//  Copyright © 2018 Makay Chapple. All rights reserved.
//

import UIKit
import PlaygroundSupport



let baseURL = URL(string: "https://itunes.apple.com/search?")!

PlaygroundPage.current.needsIndefiniteExecution = true

let task = URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
        print(string)
    }

}
task.resume()

var query: [String: String] = ["term": "media"]

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap {
            URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

PlaygroundPage.current.finishExecution()
