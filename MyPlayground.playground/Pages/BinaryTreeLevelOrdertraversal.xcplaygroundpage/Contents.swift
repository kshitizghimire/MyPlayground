//: [Previous](@previous)

import Foundation


class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

struct Queue<T> {
    private var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    mutating func dequeue() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    var front: T? {
        return array.first
    }
}

class Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        guard let root = root else {
            return result
        }
        
        var queue = Queue<TreeNode>()
        queue.enqueue(root)
        
        while !queue.isEmpty {
            var level = [Int]()
            let size = queue.count
            
            for _ in 0 ..< size {
                if let node = queue.dequeue() {
                    level.append(node.val)
                    if let leftNode = node.left {
                        queue.enqueue(leftNode)
                        
                    }
                    if let rightNode = node.right {
                        queue.enqueue(rightNode)
                    }
                }
            }
            result.append(level)
        }
        return result.reversed()
    }
}
