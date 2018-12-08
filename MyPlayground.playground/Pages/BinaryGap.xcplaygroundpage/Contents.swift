//: [Previous](@previous)

import Foundation

enum State {
    case enter
    case exit
    case none
}

let integer = 66561
let binary = String(integer, radix:2)
print(binary)

var longestBinaryGap = 0
var binaryGap = 0
var state: State = .none

for (_, value) in binary.enumerated() {
    if value == "0" {
        binaryGap += 1
    } else if value == "1" {
        if state == .none || state == .exit {
            state = .enter
            binaryGap = 0
        } else if state == .enter {
            if binaryGap == 0 {
                continue
            }
            state = .exit
            if binaryGap > longestBinaryGap {
                longestBinaryGap = binaryGap
            }
            binaryGap = 0
        }
    }
}

print(longestBinaryGap)
