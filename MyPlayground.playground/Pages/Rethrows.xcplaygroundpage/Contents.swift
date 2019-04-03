//: [Previous](@previous)

import Foundation

struct Foo {
    var string: String
    
    let closure: () throws -> Data = {
        return Data()
    }
    
    init(string: String, closure: () throws -> Data) rethrows {
        self.string = string
    }
}


