import Foundation

enum URLError: Error {
    case notConnectedToInternet
    case networkConnectionLost
    case cannotLoadFromNetwork
}

enum HTTPError: Error {
    case unauthorized
    case notFound
    case none
}

func handle(_ error: Error) {
    switch error {
        // Matching against a group of offline-related errors:
        case URLError.notConnectedToInternet,
            URLError.networkConnectionLost,
            URLError.cannotLoadFromNetwork:
            print(error)

        // Matching against a specific error:
        case let error as HTTPError where error == .unauthorized:
            print(error)

        case HTTPError.notFound:
            print(error)

        // Matching against our networking error type:
        case is HTTPError:
            print(error)

        // Fallback for other kinds of errors:
        default:
            print(error)
    }
}

let error = URLError.notConnectedToInternet
handle(error)
