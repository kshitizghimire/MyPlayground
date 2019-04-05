
import Foundation


enum URLError {
    case notConnectedToInternet
    case networkConnectionLost
    case cannotLoadFromNetwork
}
enum HTTPError {
    case unauthorized
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

    // Matching against our networking error type:
    case is HTTPError:
        print(error)

    // Fallback for other kinds of errors:
    default:
        print(error)
    }
}

