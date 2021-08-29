import Foundation

struct CountDown: IteratorProtocol, Sequence {
    var count: Int
    mutating func next() -> Int? {
        if count == 0 {
            return nil
        }
        defer {
            count -= 1
        }
        return count
    }
}

var countDown = CountDown(count: 3)

for i in countDown {
    print(i)
}

while let c = countDown.next() {
    print(c)
}
