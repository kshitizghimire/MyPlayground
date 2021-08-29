//: [Previous](@previous)

import Foundation

func strCompare(s1: String, s2: String) -> Bool {
    if s1.count == s2.count {
        var i = s1.startIndex
        while i < s1.endIndex {
            if s1[i] != s2[i] {
                return false
            }
            i = s1.index(after: i)
        }
        return true
    }

    return false
}

strCompare(s1: "abc", s2: "abc")
