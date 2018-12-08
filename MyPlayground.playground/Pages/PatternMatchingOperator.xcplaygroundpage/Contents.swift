//: [Previous](@previous)

import Foundation

struct Person {
    let name : String
    
    static func ~=(pattern: String, value: Person) -> Bool {
        print("called pattern matching")
        return value.name == pattern
    }
}


let p = Person(name: "Alessandro")

//if case "p" = p {
//     print("Alessandro")
//}

switch p {
case "Alessandro":
    print("Alessandro")
case "abc":
    print("abc")
    
default:
    break
    
}

