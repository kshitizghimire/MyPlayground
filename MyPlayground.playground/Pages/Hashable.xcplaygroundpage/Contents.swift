//: [Previous](@previous)

import Foundation
import UIKit

class Foo: Hashable {
    static func == (lhs: Foo, rhs: Foo) -> Bool {
        return lhs.a == rhs.a
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.a)
    }
    let a = ""
}


let foo = Foo()
print(foo.hashValue)
