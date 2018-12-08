//: [Previous](@previous)

import Foundation

enum Foo: RawRepresentable {
    init?(rawValue: String) {
        switch rawValue {
        case "a": self = .a
        case "b": self = .b
        default: return nil
        }
    }
    
    
    typealias RawValue = String
    
    var rawValue: String {
        switch self {
        case .a:
            return "a"
        case .b:
            return "b"
        }
    }
    
    case a
    case b
    
    static func ~=(pattern: String, value: Foo) -> Bool {
        
        let `return` =  value.rawValue == pattern
        print("Pattern: \(pattern)   \(`return`)")
        return `return`
    }
}

let f = Foo.b
switch f {
    
case "ccc":
    print("ccc")
case "b":
    print("b")
case "ddd":
    print("ddd")
case "a":
    print("a")
    
default:
    print("default")
    break
}
