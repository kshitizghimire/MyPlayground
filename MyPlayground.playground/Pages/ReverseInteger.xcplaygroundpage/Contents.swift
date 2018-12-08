//: [Previous](@previous)

import Foundation

let number = 23459

let string = String(number)

var array = [String]()

for c in string.reversed() {
    array += [String(c)]
  
}

print(array)

for str in (0...array.count-1).reversed() {
    print(str)
}
