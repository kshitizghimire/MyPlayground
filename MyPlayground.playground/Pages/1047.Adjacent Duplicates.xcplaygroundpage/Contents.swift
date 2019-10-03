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
    func removeDuplicates(_ S: String) -> String {
        var stack = Stack<Character>()
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
