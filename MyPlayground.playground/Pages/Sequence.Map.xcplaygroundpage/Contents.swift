
extension Sequence {
    public func map2<T>( _ transform: (Element) -> T) -> [T] {
        var result = [T]()
        for element in self {
            let newElement = transform(element)
            result.append(newElement)
        }
        return result
    }
}

let m = [2,4,6,3,5].map2 { (num) -> String in
    return String(num)
}
print(m)

extension Sequence {
    public func flatMap2<T: Sequence>( _ transform: (Element) -> T) -> [T.Element] {
        var result = [T.Element]()
        for element in self {
            result += transform(element)
        }
        return result
    }
}

let cm = [[2,4],[6],[3,5]].flatMap2 { $0 }
print(cm)

let nums = [
    0...19,
    40...50
]
let allNums = nums.flatMap2 { $0 }
print(allNums)
