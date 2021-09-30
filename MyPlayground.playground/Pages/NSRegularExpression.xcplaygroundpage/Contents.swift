import Foundation

let testString = """
The cat
sat on
the mat
"""

public struct RegularExpression: ExpressibleByStringLiteral {
    public let pattern: String
    private let regularExpression: NSRegularExpression

    init(
        _ pattern: String
    ) {
        self.pattern = pattern
        do {
            regularExpression = try NSRegularExpression(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression pattern: \(pattern).")
        }
    }

    public init(
        stringLiteral value: String
    ) {
        self.init(value)
    }

    public func matches(_ string: String) -> Bool {
        regularExpression.firstMatch(
            in: string,
            options: [],
            range: NSRange(string.startIndex..., in: string)
        ) != nil
    }
}

let regularExpression: RegularExpression = "the"
regularExpression.matches(testString)
