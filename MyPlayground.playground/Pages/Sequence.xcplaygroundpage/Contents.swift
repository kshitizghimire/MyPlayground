

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

let m = [2].map2 { String($0) }
print(m)
