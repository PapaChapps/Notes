import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let baseURL = URL(string: "https://api.nasa.gov/planetary/apod?api_key=KZmkhQ5rvyFYVxRcwQhSrpBMAcNdUmNQzvchKwYg")!

let query : [String: String] = ["api_key": "KZmkhQ5rvyFYVxRcwQhSrpBMAcNdUmNQzvchKwYg","date": "1994-12-29"]



let task = URLSession.shared.dataTask(with: baseURL) {(data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8){
        print(string)
    }
    
}
task.resume()

extension URL {
    func withQueries (_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap{ URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
