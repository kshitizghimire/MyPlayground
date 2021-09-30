import Foundation

class TreeNode: Hashable {
    static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        lhs.val == rhs.val
            && lhs.left == rhs.left
            && lhs.right == rhs.right
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(val)
        //        hasher.combine(left)
        //        hasher.combine(right)
    }

    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(
        _ val: Int
    ) {
        self.val = val
        left = nil
        right = nil
    }
}

let one = TreeNode(1)
one.left = TreeNode(1)
let two = TreeNode(1)

one.hashValue
two.hashValue

var map = [TreeNode: TreeNode]()
map[one] = one
map[two] = two

print(map.count)
