import UIKit
import PlaygroundSupport

var url = URL(string: "http://www.apple.com")!

let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let data = data, let string = String(data: data, encodeing: .utf8) {
        print(string)
    }
}

task.resume()
