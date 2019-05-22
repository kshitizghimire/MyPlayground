//: [Previous](@previous)

import Foundation
import UIKit
//Input: J = "aA", S = "aAAbbbb"
//Output: 3

let jewelString = "aA"
let stoneString = "aAAbbbccccccccccd"


class Solution {
    
    func numberOFJewels(jewel: String, stone: String) -> Int {
        
        var sum = 0
        var jewels: Set<Character> = []
        
        jewel.forEach { character in
            jewels.insert(character)
        }
        
        stone.forEach { character in
            if jewels.contains(character) {
                sum += 1
            }
        }
        
        return sum
    }
}

let output = Solution().numberOFJewels(jewel: jewelString, stone: stoneString)
print(output)

