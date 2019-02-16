//: [Previous](@previous)

import Foundation

class LinkList {
    class Node {
        let data: Int
        var next: Node? = nil
        
        init(data: Int) {
            self.data = data

        }
    }
    
    static func print(node: Node) {
        var currentNode: Node? = node
        while currentNode != nil {
            Swift.print(currentNode!.data)
         
            currentNode = node.next
        }
    }
}

let first = LinkList.Node(data: 1)
let second = LinkList.Node(data: 2)
first.next = second
let third = LinkList.Node(data: 3)
second.next = third



LinkList.print(node: first)



