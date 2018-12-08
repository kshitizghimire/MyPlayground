//: [Previous](@previous)

import Foundation

protocol ProtocolA {
    var propety: String { get }
}

class A: ProtocolA {
    var propety = "some string"
}


class B {
    let a: ProtocolA
    init(a: ProtocolA) {
        self.a = a
    }
}

let objA = A()
let objB = B(a:objA)


