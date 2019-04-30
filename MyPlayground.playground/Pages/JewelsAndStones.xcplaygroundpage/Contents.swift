//: [Previous](@previous)

import Foundation

//Input: J = "aA", S = "aAAbbbb"
//Output: 3

let jewelString = "aA"
let stoneString = "aAAbbbccccccccccd"


class Solution {
    
    func numberOFJewels(jewel: String, stone: String) -> Int {
        
        var stoneDictionary = [Character: Int]()

        stoneString.forEach { character in
            let key = character
            
            if let value = stoneDictionary[key] {
                stoneDictionary[key] = value + 1
            } else {
                stoneDictionary[key] = 1
            }
        }
        
        var sum: Int = 0
        jewelString.forEach { character in 
            let key = character
            if let value = stoneDictionary[key] {
                sum = sum + value
            }
        }
        
        return sum
    }
}

let output = Solution().numberOFJewels(jewel: jewelString, stone: stoneString)
print(output)

