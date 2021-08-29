import Foundation

enum FetchError: Error {
    case serviceUnavailable
}
struct Github: Codable {
    let name: String
}

func fetch() throws -> Github {
    var completionHandler: (data: Data?, Error?)
    let dispatchGroup = DispatchGroup()
    dispatchGroup.enter()
    URLSession.shared
        .dataTask(with: URL(string: "https://api.github.com/users/kshitizghimire")!) {
            data,
            request,
            error in
            completionHandler = (data, error)
            dispatchGroup.leave()
        }
        .resume()
    dispatchGroup.wait()
    print(completionHandler)

    guard let data = completionHandler.data else { throw FetchError.serviceUnavailable }

    let decoder = JSONDecoder()
    let response = try decoder.decode(Github.self, from: data)
    return response
}

do {
    let github = try fetch()
    print(github.name)
}
catch {
    print(error)
}
