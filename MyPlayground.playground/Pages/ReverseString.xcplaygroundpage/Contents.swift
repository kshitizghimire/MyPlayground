//: Playground - noun: a place where people can play

class Solution {
    func reverseString(_ string: String) -> String {

        var result = Array(string)
        var start = result.startIndex
        var end = result.endIndex - 1

        while start < end {
            let temp = result[start]
            result[start] = result[end]
            result[end] = temp
            start += 1
            end -= 1
        }
        return String(result)
    }
}

let string = "some 👨‍👩‍👦‍👦 string"

print(Solution().reverseString(string))
