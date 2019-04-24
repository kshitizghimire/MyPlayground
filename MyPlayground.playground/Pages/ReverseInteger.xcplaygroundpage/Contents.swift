//: [Previous](@previous)

import Foundation


class Solution {
    func reverse(_ x: Int) -> Int {
        var result = 0
        var number = x

        while number != 0 {
            let last = number % 10
            result = (result * 10) + last
            number = number/10
        }

        if result > Int32.max || result < Int32.min {
            result = 0
        }
        return result
    }
}

let number = 123
Solution().reverse(number)
