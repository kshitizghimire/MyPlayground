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
    let mapping: [Character: Character] = [")": "(", "}": "{", "]": "["]
    func isValid(_ s: String) -> Bool {
        let stack = Stack()
        for character in s {
            switch character {
            case "(","{","[":
                stack.push(character)
            case ")", "}", "]":
                if mapping[character] == stack.peek() {
                    stack.pop()
                } else {
                    return false
                }
            default:
                return false
            }
        }
        return stack.isEmpty
    }
}

let output = Solution().isValid("([)]")
