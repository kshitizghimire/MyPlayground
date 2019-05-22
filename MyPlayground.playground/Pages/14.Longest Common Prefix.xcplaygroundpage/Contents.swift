//: [Previous](@previous)

import Foundation

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.isEmpty { return "" }
        var longestCommonPrefix = strs.first!

        for str in strs {
            longestCommonPrefix = Solution.commonPrefix(longestCommonPrefix, str)
            if longestCommonPrefix.isEmpty { break }
        }
        return longestCommonPrefix
    }

    static func commonPrefix(_ string1: String, _ string2: String) -> String {
        var commonPrefix = ""

        let (first, second) = string1.count > string2.count ? (string2, string1) : (string1, string2)

        for (i, character) in first.enumerated() {
            let index = first.index(first.startIndex, offsetBy: i)
            if first[index] == second[index] {
                commonPrefix.append(character)
            } else {
                break
            }
        }
        return commonPrefix
    }
}

let output = Solution().longestCommonPrefix(["flower","flow","flight"])
