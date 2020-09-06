
import Foundation

protocol Err {
    associatedtype Model
    associatedtype Error
}

class BAError: Codable, CustomStringConvertible, CustomDebugStringConvertible {
    var code: String
    var errDescription: String
    
    enum CodingKeys: String, CodingKey {
        case code
        case errDescription
    }
    
    init(code: String, errDescription: String) {
        self.code = code
        self.errDescription = errDescription
    }
    
    var description: String {
        return "\(self.code)- \(self.errDescription)"
    }
    
    var debugDescription: String {
        return "Debug description:\(self.code)- \(self.errDescription)"
    }
}


struct A: Err {
    typealias Model = BAError
    
    typealias Error = Int
}

class B: Err {
    typealias Model = BAError
    typealias Error = Swift.Error
}

let a = A()
type(of: a)

print(Bundle(for: B.self).bundleURL)

A.Model.self
A.Error.self

let baError = BAError(code: "code", errDescription: "desc")
let encoded = try JSONEncoder().encode(baError)

print(String(data: encoded, encoding: .utf8)!)

type(of: String.self)
let decoded = try JSONDecoder().decode(A.Model.self, from: encoded)
print(decoded)
debugPrint(decoded)


