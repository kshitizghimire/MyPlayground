import Foundation

struct MyCollection: Collection {
    let storage: [Int]
    var count: Int
    init(
        storage: [Int]
    ) {
        self.storage = storage
        count = storage.count - 1
    }

    subscript(position: Int) -> Int {
        storage[position]
    }

    var startIndex: Int {
        storage.startIndex
    }

    var endIndex: Int {
        storage.endIndex
    }

    func index(after i: Int) -> Int {
        storage.index(after: i)
    }
}

extension MyCollection: IteratorProtocol, Sequence {
    mutating func next() -> Int? {
        if count < 0 {
            return nil
        }
        defer {
            count -= 1
        }
        return storage[count]
    }
}

let newCol = MyCollection(storage: [123_490])

for i in newCol {
    print(i)
}
