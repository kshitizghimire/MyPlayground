import Foundation

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var l = s.startIndex
        var r = s.index(before: s.endIndex)
        while l <= r {
            if s[l] != s[r] {
                return false
            }
            l = s.index(after:l)
            r = s.index(before:r)
        }
        return true
    }
}

Solution().isPalindrome("racecar")
