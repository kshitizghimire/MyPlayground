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

class Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else {
            return 0
        }
        
        if root.left == nil && root.right == nil {
            return 1
        }
        
        let leftDepth = root.left != nil ? minDepth(root.left) : Int.max
        let rightDepth = root.right != nil ? minDepth(root.right) : Int.max
        
        return min(leftDepth, rightDepth) + 1
        
    }
}


