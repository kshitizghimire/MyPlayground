//: [Previous](@previous)

import Foundation

struct Stack<Element> {
    private var array: [Element] = []
    mutating func push(_ element: Element) { array.append(element) }
    mutating func pop() -> Element? { return array.popLast() }
    func peek() -> Element? { return array.last }
    var isEmpty: Bool { return array.isEmpty }
    var count: Int { return array.count }
}

class Solution {
    let mapping: [Character: Character] = [")": "(", "}": "{", "]": "["]
    func isValid(_ s: String) -> Bool {
        var stack = Stack<Character>()
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
