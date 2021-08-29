import Foundation
import PlaygroundSupport

struct Github: Codable {
    let name: String?
    let location: String?
    let followers: Int?
    let avatarUrl: String?
    let repos: Int?

    private enum CodingKeys: String, CodingKey {
        case name
        case location
        case followers
        case repos = "public_repos"
        case avatarUrl = "avatar_url"
    }
}

let url = URL(string: "https://api.github.com/users/kshitizghimire")!
let request = URLRequest(url: url)
let session = URLSession(configuration: .default)

let task = session.dataTask(with: request) { (data, response, error) in
    guard let data = data else { return }
    do {
        let decoder = JSONDecoder()
        let github = try decoder.decode(Github.self, from: data)
        print(github)

    }
    catch let err {
        print("Err", err)
    }
}

task.resume()

PlaygroundPage.current.needsIndefiniteExecution = true
