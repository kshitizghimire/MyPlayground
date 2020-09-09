//: [Previous](@previous)

import Foundation

struct Heap<Element> {
    private var elements = [Element]()
    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }
    private let areInIncreasingOrder: (Element, Element) -> Bool
    init(sortBy areInIncreasingOrder: @escaping (Element, Element) -> Bool) {
        self.areInIncreasingOrder = areInIncreasingOrder
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
        while childIndex > 0 && areInIncreasingOrder(child, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            parentIndex = parentOf(childIndex)
        }
        elements[childIndex] = child
    }
    mutating func insert(_ value: Element) {
        elements.append(value)
        heapifyUp(index: elements.count - 1)
    }
    private mutating func heapifyDown(index: Int, endIndex: Int) {
        let leftChildIndex = leftOf(index)
        let rightChildIndex = leftChildIndex + 1
        var first = index
        if leftChildIndex < endIndex && areInIncreasingOrder(elements[leftChildIndex], elements[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && areInIncreasingOrder(elements[rightChildIndex], elements[first]) {
            first = rightChildIndex
        }
        if first == index { return }
        elements.swapAt(index, first)
        heapifyDown(index: first, endIndex: endIndex)
    }
    mutating func remove() -> Element? {
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
    func peek() -> Element? { return elements.first }
}

var heap = Heap<Int>(sortBy: <)

let array = [1,4,5,7,3,10,10,7]
for item in array {
    heap.insert(item)
}

var sorted = [Int]()
while heap.isEmpty == false {
    sorted.append(heap.remove()!)
}
print(sorted)
