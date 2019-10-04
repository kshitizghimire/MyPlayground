//: [Previous](@previous)

import Foundation

let string = "a👨‍👩‍👧‍👦bcd"

let secondIndex = string.index(after: string.startIndex)
let thirdIndex = string.index(string.startIndex, offsetBy: 2)
let lastIndex = string.index(before: string.endIndex)

print(string[secondIndex])
print(string[thirdIndex])
print(string[lastIndex]) 
