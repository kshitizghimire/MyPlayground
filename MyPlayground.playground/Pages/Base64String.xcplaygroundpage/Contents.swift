//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

let base64EncodedString = str.data(using: .utf8)?
    .base64EncodedString()

let string = String(data:Data(base64Encoded: base64EncodedString!)!, encoding: .utf8)
