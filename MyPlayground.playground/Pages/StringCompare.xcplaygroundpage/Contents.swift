//: [Previous](@previous)

import Foundation

func strCompare(s1: String, s2: String) -> Bool {
    if s1.count == s2.count {
        for i in 0..<s1.count {
            let first = s1[s1.index(s1.startIndex, offsetBy: i)]
            let second = s2[s2.index(s2.startIndex, offsetBy: i)]
            print(first, second)
            if first != second {
                return false
            }
        }
        return true
    }
    
    return false
}

strCompare(s1: "abc", s2: "ABC")

func detectCapitalUse(_ word: String) -> Bool {
    return word == word.lowercased() || word == word.uppercased() || word == word.capitalized
       
}

let c:Character = "a"
print(type(of: c.isUppercase))
print(type(of: c.uppercased()))
detectCapitalUse("Abc")
