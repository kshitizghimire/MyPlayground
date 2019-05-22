//: [Previous](@previous)

import Foundation

class Stack {
    private var array = [Character]()
    func push(_ value: Character) {
        self.array.append(value)
    }
    func pop() -> Character? {
       return self.array.popLast()
    }
    func peek() -> Character? {
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
            if stack.peek() == character {
                stack.pop()
            } else {
                stack.push(character)
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
