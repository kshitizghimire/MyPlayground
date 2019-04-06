//: [Previous](@previous)

import Foundation

struct RegularExpression {
    private let regex: NSRegularExpression

    init(regex: NSRegularExpression) {
        self.regex = regex
    }

    func matches(in string: String, options: NSRegularExpression.MatchingOptions = []) -> [NSTextCheckingResult] {
        return regex.matches(in: string, options: options, range: NSMakeRange(0, string.count))
    }
}

extension RegularExpression: ExpressibleByStringLiteral {
    init(stringLiteral value: String) {
        let regex = try! NSRegularExpression(pattern: value, options: [])
        self.init(regex: regex)
    }
}

let regex: RegularExpression = "abc"
print(regex.matches(in: "abc")) // prints that match is found
