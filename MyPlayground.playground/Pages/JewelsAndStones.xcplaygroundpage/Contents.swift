//: [Previous](@previous)

import Foundation

//Input: J = "aA", S = "aAAbbbb"
//Output: 3

let jewelString = "aA"
let stoneString = "aAAbbbccccccccccd"


class Solution {
    
    private var stoneDictionary: Dictionary<String,Int> = [:]
    
    func numberOFJewels(jewel: String, stone: String) -> Int {
        
        
        
        for character in stoneString {
            let key = String(character)
            
            if let value = stoneDictionary[key] {
                stoneDictionary[key] = value + 1
            } else {
                stoneDictionary[key] = 1
            }
        }
        
        var sum: Int = 0
        for character in jewelString {
            let key = String(character)
            if let value = stoneDictionary[key] {
                sum = sum + value
            }
        }
        
        return sum
    }
}

let output = Solution().numberOFJewels(jewel: jewelString, stone: stoneString)
print(output)

