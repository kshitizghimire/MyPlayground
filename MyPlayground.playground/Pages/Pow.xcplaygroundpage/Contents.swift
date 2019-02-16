//: [Previous](@previous)

import Foundation

class Solution {
    func myPow(_ x: Double, _ n: Int) -> Double {
        
        if n == 0 {
            return 1
        }
        
        var result: Double = 1
        let endIndex = n.magnitude
        let isNegative = n < 0
        for i in 1 ... endIndex {
            if isNegative {
                result *= 1 / x
            } else {
                result *= x
            }
            
        }
        
        return result
        
    }
}
