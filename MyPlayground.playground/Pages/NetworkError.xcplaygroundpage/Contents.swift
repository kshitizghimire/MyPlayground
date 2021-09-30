protocol NetworkError {
    associatedtype Custom

    var custom: Custom? { get }
    var `default`: Error? { get }
}

struct CARError {
    var errorCode: String
    var errorDescription: String
}

enum CARNetworkError: NetworkError {
    case custom(error: CARError)
    case `default`(error: Error)
    var custom: CARError? {
        switch self {
        case let .custom(error):
            return error
        case .default:
            return nil
        }
    }

    var `default`: Error? {
        switch self {
        case .custom:
            return nil
        case let .default(error):
            return error
        }
    }
}

enum Result<Value> {
    case success(Value)
    case failure(CARNetworkError)
}

func fooFunc(result: Result<Int>) {
    switch result {
    case let .success(val):
        print(val)
    case let .failure(error):
        switch error {
        case let .custom(error):
            print(error)
        case let .default(error):
            print(error)
        }
    }
}

let result = Result<Int>
    .failure(.custom(error: CARError(errorCode: "1000", errorDescription: "Bad request")))

fooFunc(result: result)

enum DefaultError: Error {
    case dataNotFound
}

let resultDefault = Result<Int>.failure(.default(error: DefaultError.dataNotFound))

fooFunc(result: resultDefault)
