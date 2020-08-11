//: [Previous](@previous)

import Foundation

class BSTree {
    class TreeNode {
        let val:String
        var left: TreeNode
        var right: TreeNode
        
        init(_ val: String) {
            self.val = val
        }
    }
    
    var root: TreeNode?
    
    public func search(_ root: TreeNode?, _ val: String) -> TreeNode? {
        if let root = root, val == root.val {
            return root
        }
        
        return val < root?.val ? search(root?.left, val) : search(root?.right, val);
    }
    
    public func insert(_ root: TreeNode?,_ val: String) -> TreeNode {
        if root == nil {
            return TreeNode(val)
        }
        if val > root.val {
            // insert into the right subtree
            root.right = insert(root?.right, val);
        } else if val == root.val {
            // skip the insertion
            return root
        } else {
            // insert into the left subtree
            root?.left = insert(root.left, val);
            return root;
        }
    }
    
    /*
     * One step right and then always left
     */
    public func successor(_ root: TreeNode) -> String {
        var root = root.right
        while (root.left != nil) {
            root = root.left
        }
        return root.val
    }
    
    /*
     * One step left and then always right
     */
    public func predecessor(_ root: TreeNode) -> String {
        var root = root.right
        while root.right != nil {
            root = root.right
        }
        return root.val
    }
    
    public func deleteNode(_ root: TreeNode?,_ key: String) -> TreeNode? {
        if (root == nil) {
            return nil;
        }
        
        // delete from the right subtree
        if (key > root.val) {
            root.right = deleteNode(root.right, key);
        }
        // delete from the left subtree
        else if (key < root.val) {
            root.left = deleteNode(root.left, key);
        }
        // delete the current node
        else {
            // the node is a leaf
            if (root.left == nil && root.right == nil) {
                root = nil;
            }
            // the node is not a leaf and has a right child
            else if (root.right != nil) {
                root.val = successor(root);
                root.right = deleteNode(root.right, root.val);
            }
            // the node is not a leaf, has no right child, and has a left child
            else {
                root.val = predecessor(root);
                root.left = deleteNode(root.left, root.val);
            }
        }
        return root;
    }
}
