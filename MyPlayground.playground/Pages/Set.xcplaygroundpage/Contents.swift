//: [Previous](@previous)

import Foundation

struct Foo: Hashable {
    let val: Int
    func hash(into hasher: inout Hasher) {
        if val == 2 || val == 4 {
            hasher.combine(2)
        } else {
        hasher.combine(val)
        }
    }
    
//    var hashValue: Int {
//        if val == 2 || val == 4 {
//            return 222
//        }
//        return val % 19
//    }
}

var set = Set<Foo>()


let two = Foo(val: 2)
two.hashValue
let four = Foo(val: 4)
four.hashValue
let three = Foo(val: 3)
three.hashValue

set.insert(two)
set.insert(four)
set.insert(three)

print(set.union([three]))


