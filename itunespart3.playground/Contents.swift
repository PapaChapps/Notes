import UIKit
import PlaygroundSupport

struct StoreItem: Codable{
    let term: String
    let media: String
    
    enum searchTerms: String, CodingKey {
        case term = "term"
        case music = "music"
    }
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: StoreItem.CodingKeys.self)
        self.term = try valueContainer.decode(String.self, forKey: CodingKeys.term)
        self.media = try valueContainer.decode(String.self, forKey: CodingKeys.media)
    }
    func fetchItem( matching query: [String: String], completion: @escaping ([StoreItem]?) -> Void) { let baseURL = URL(string: "https://itunes.apple.com/search?")!}
}


var query: [String: String] = ["term": "Queen", "media": "music"]

extension URL {
    func withQueries(_ queries: [String: String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap {
            URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}

PlaygroundPage.current.needsIndefiniteExecution = true

let baseURL = URL(string: "https://itunes.apple.com/search?")!

let task = URLSession.shared.dataTask(with: baseURL.withQueries(query)!) { (data, response, error) in
    if let data = data,
        let string = String(data: data, encoding: .utf8) {
        print(string)
    }
    
}
task.resume()

PlaygroundPage.current.finishExecution()
