//: [Previous](@previous)

import Foundation
import Combine
struct Repository: Codable {
    var name: String
    var url: URL
}

let url = URL(string: "https://api.github.com/repos/johnsundell/publish")!
let publisher = URLSession.shared.dataTaskPublisher(for: url)
let cancellable = publisher.sink(
    receiveCompletion: { completion in
        switch completion {
        case .failure(let error):
            print(error)
        case .finished:
            print("Success")
        }
},
    receiveValue: { value in
        let decoder = JSONDecoder()
        
        do {
            let repo = try decoder.decode(Repository.self, from: value.data)
            print(repo)
        } catch {
            print(error)
        }
}
)
