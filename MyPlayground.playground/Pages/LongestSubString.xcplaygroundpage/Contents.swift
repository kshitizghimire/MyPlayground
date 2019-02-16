//: [Previous](@previous)

import Foundation

class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var lookUp = [Character: Character]()
        var count = 0
        var result = 0
        for c in s {
            
            if let _ = lookUp[c] {
                if result < count {
                    result = count
                }
                count = 1
                lookUp.removeAll()
                lookUp[c] = c
                
                
            } else {
                lookUp[c] = c
                count += 1
            }
        }
        if result < count {
            result = count
        }
        
        return result
    }
}

Solution.init().lengthOfLongestSubstring("dvdv")
