//: [Previous](@previous)

import Foundation

class Stack {
    private var array = [String]()
    func push(_ value: String) {
        self.array.append(value)
    }
    func pop() -> String? {
       return self.array.popLast()
    }
    func peek() -> String? {
        return self.array.last
    }
    var isEmpty: Bool {
        return self.array.count == 0
    }
}

class Solution {
    func removeDuplicates(_ S: String) -> String {
        let stack = Stack()
        S.forEach { character in
            let letter = "\(character)"
            if stack.peek() == letter {
                stack.pop()
            } else {
                stack.push(letter)
            }
        }

        var result = ""
        while !stack.isEmpty {
            result = "\(stack.pop()!)\(result)"
        }

        return result
    }
}

let input = "abbaca"
let output = Solution().removeDuplicates(input)
