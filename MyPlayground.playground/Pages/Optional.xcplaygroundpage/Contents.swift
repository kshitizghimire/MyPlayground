//: [Previous](@previous)

import Foundation


let a = Optional<Int>.some(1)
let b = Optional.init(a)
let c = Optional(b)


let number = 1

let divisableByFive = number % 5 == 0
let divisableByThree = number % 3 == 0

switch (divisableByFive, divisableByThree) {
case (true, true):
    print("some")
case (true, false):
    print("a")
case (false, true):
    print("b")
default:
    print("")
}

if number % 5 == 0 && number % 3 == 0 {
    print("some")
} else if number % 5 == 0 {
    print("a")
} else if number % 3 == 0 {
    print("b")
}



