//: [Previous](@previous)

import Foundation

func someFunction(left: Int, right: Int) {
    print(left,right)
    
}

var f = someFunction
print(type(of: f))

f(2,3)
var diffrentFuncType: (() -> Void)?
type(of:diffrentFuncType)

let closure: (Int, Int) -> Int = { (a, b) -> Int in
    return a+b
}
closure(2, 4)

type(of: closure)
