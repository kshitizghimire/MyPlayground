import Foundation

class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init(
        _ val: Int
    ) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else {
            return "X"
        }
        return "\(root.val)" + "," + serialize(root.left) + "," + serialize(root.right)
    }

    func deserialize(_ data: String) -> TreeNode? {
        var queue = data.split(separator: ",").map { String($0) }
        return deserialize(&queue)
    }

    func deserialize(_ array: inout [String]) -> TreeNode? {
        guard array.isEmpty == false else { return nil }
        let value = array.removeFirst()
        if value == "X" { return nil }
        let node = TreeNode(Int("\(value)")!)
        node.left = deserialize(&array)
        node.right = deserialize(&array)
        return node
    }
}

let five = TreeNode(5)
let four = TreeNode(4)
let three = TreeNode(3)
let two = TreeNode(2)
let one = TreeNode(1)
one.left = two
one.right = three
three.left = four
three.right = five

let serialized = Codec().serialize(one)
let deserialized = Codec().deserialize(serialized)
