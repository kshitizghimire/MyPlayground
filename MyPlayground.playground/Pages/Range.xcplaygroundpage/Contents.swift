//: [Previous](@previous)

import Foundation

let array = [2, 3, 4, 5, 6]

let sorted = array.sorted { $0 > $1 }.suffix(2)

print(sorted)

var str = "Hello, playground👨‍👩‍👧‍👦"
let range1 = str.startIndex...

let range2 = ..<str.endIndex
type(of: range2)
str[range1]
str[range2]
