//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

str.data(using: .utf8)?
    .base64EncodedString()
