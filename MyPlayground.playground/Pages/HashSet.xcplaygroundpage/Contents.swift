//: [Previous](@previous)

import Foundation

class MyHashSet {
    
    class Bucket {
        class LinkList {
            class Node {
                var val: Int = 0
                var next: Node?
                init(val: Int) {
                    self.val = val
                }
            }
            var head: Node?
            
            func append(_ value: Int) {
                if head == nil {
                    head = Node(val: value)
                    return
                }
                var current = head
                while current?.next != nil {
                    current = current?.next
                }
                current?.next = Node(val: value)
            }
            
            func remove(_ value: Int) {
                
            }
            
        }
        var storage = LinkList()
        func add(_ key: Int) {
            storage.append(key)
        }
        func remove(_ key: Int) {
            storage.remove(key)
        }
        func contains(_ key: Int) -> Bool {
            return false
        }
    }
    
    private let buckets: [Bucket]
    let base = 769
    /** Initialize your data structure here. */
    init() {
        self.buckets = Array(repeating: Bucket(), count:base)
    }
    
    func _hash(_ key: Int) -> Int {
        return key % base
    }
    
    
    func add(_ key: Int) {
        let index = _hash(key)
        let bucket = buckets[index]
        bucket.add(key)
        
    }
    
    func remove(_ key: Int) {
        let index = _hash(key)
        let bucket = buckets[index]
        bucket.remove(key)
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let index = _hash(key)
        let bucket = buckets[index]
        return bucket.contains(key)
    }
}
