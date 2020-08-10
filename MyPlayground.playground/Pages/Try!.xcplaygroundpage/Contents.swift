//: [Previous](@previous)

import Foundation

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        
        var result = [[Character]: [String]]()
        for str in strs {
            let sorted = str.sorted()
            if var array = result[sorted] {
                array.append(str)
                result[sorted] = array
            } else {
                result[sorted] = [str]
            }
            
        }

        return Array(result.values)
    }
}

Solution().groupAnagrams(["eat","tea","tan","ate","nat","bat"])
