//: Playground - noun: a place where people can play

class Solution {
    func reverseString(_ string: String) -> String {
        let stringArray = Array(string)
        
        var index = stringArray.count - 1
        
        var reversedString = String()
        
        while index >= 0 {
            reversedString += String(stringArray[index])
            index -= 1
        }
        return reversedString
    }
}

let string = "some string"

print(Solution().reverseString(string))
