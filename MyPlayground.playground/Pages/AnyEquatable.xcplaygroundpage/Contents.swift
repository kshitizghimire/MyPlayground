import Foundation

public struct AnyEquatable: Equatable {
    public let value: Any
    private let equals: (Any) -> Bool

    public init<E: Equatable>(
        _ value: E
    ) {
        self.value = value
        equals = { ($0 as? E) == value }
    }

    public static func == (lhs: AnyEquatable, rhs: AnyEquatable) -> Bool {
        lhs.equals(rhs.value) || rhs.equals(lhs.value)
    }
}

func foocompare(first: AnyEquatable, second: AnyEquatable) -> Bool {
    first == second
}

let a = AnyEquatable(2)
let b = AnyEquatable("b")

print(foocompare(first: a, second: b))
