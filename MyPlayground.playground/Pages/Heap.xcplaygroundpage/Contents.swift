//: [Previous](@previous)

import Foundation

struct Heap<T> {
    private var elements = [T]()
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    private let orderCriteria: (T, T) -> Bool
    init(sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
    }
    private func parentOf(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    private func leftOf(_ index: Int) -> Int {
        return (2 * index) + 1
    }
    private func rightOf(_ index: Int) -> Int {
        return (2 * index) + 2
    }
    private mutating func heapifyUp(index: Int) {
        var childIndex = index
        let child = elements[childIndex]
        var parentIndex = parentOf(childIndex)
        while childIndex > 0 && orderCriteria(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = parentOf(childIndex)
        }
        elements[childIndex] = child
    }
    mutating func insert(_ value: T) {
        elements.append(value)
        heapifyUp(index: elements.count - 1)
    }
    private mutating func heapifyDown(index: Int, endIndex: Int) {
        let leftChildIndex = leftOf(index)
        let rightChildIndex = leftChildIndex + 1
        var first = index
        if leftChildIndex < endIndex && orderCriteria(elements[leftChildIndex], elements[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(elements[rightChildIndex], elements[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        elements.swapAt(index, first)
        heapifyDown(index: first, endIndex: endIndex)
    }
    mutating func remove() -> T? {
        guard elements.isEmpty == false else { return nil }
        if elements.count == 1 {
            return elements.removeLast()
        } else {
            let value = elements[0]
            elements[0] = elements.removeLast()
            heapifyDown(index: 0, endIndex: elements.count)
            return value
        }
    }
    func peek() -> T? { return elements.first }
}

var heap = Heap<Int>(sort: <)

let array = [1,4,5,7,3,10,10,7]

for item in array {
    heap.insert(item)
}

while heap.isEmpty == false {
    print((heap.remove()) ?? 0)
}

let s = Set(array)
let a = Array(s)
