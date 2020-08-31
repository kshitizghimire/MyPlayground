//: [Previous](@previous)

import Foundation

final class BSTree {
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?
        init(_ val: Int) {
            self.val = val
        }
    }
    func search(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if val == root.val {
            return root
        }
        return val < root.val ? search(root.left, val) : search(root.right, val);
    }
    func insert(_ root: TreeNode?,_ val: Int) -> TreeNode {
        guard let root = root else {
            return TreeNode(val)
        }
        if val < root.val {
            root.left = insert(root.left,val)
        } else if val > root.val {
            root.right = insert(root.right,val)
        }
        return root
    }
    private func successor(_ root: TreeNode) -> Int {
        var root: TreeNode? = root.right
        while root?.left != nil {
            root = root?.left
        }
        return root!.val
    }
    private func predecessor(_ root: TreeNode) -> Int {
        var root: TreeNode? = root.left
        while root?.right != nil {
            root = root?.right
        }
        return root!.val
    }
    func deleteNode(_ root: TreeNode?,_ key: Int) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        if key > root.val {
            root.right = deleteNode(root.right, key)
        } else if key < root.val {
            root.left = deleteNode(root.left, key);
        } else {
            if root.left == nil && root.right == nil {
                return nil
            } else if root.right != nil {
                root.val = successor(root)
                root.right = deleteNode(root.right, root.val)
            } else {
                root.val = predecessor(root)
                root.left = deleteNode(root.left, root.val)
            }
        }
        return root
    }
}
