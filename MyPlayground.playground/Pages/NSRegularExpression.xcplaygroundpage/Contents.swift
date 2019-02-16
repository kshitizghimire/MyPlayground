//: [Previous](@previous)

import Foundation

// look for the exact word "the"
let pattern = "the"

// we're starting with no options for creating the regex
let regexOptions: NSRegularExpression.Options = []
let regex = try NSRegularExpression(pattern: pattern, options: regexOptions)

// a nice multi-line string to work with
let testString = """
The cat
sat on
the mat
"""

// check whether the string matches, and print one of two messages
if let index = regex.firstMatch(in: testString, range: NSRange(location: 0, length: testString.utf8.count)) {
    print("Match!")
} else {
    print("No match.")
}
