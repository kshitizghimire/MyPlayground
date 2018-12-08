//: [Previous](@previous)

import Foundation

let family1 = "👨‍👩‍👧‍👦abc"

let family2 = "👨\u{200D}👩\u{200D}👧\u{200D}👦abc"
let family3 = "👱🏾\u{200D}👩🏽\u{200D}👧🏿\u{200D}👦🏻"
family2.utf8.count

family3.unicodeScalars.forEach { (scalar) in
    print(scalar, separator: "",terminator: "")
    print(String(scalar.value, radix: 16, uppercase: true))

}

family1 == family2

family1.unicodeScalars.map {
    "U+\(String($0.value, radix: 16, uppercase: true))"
}
family1.applyingTransform(.toUnicodeName, reverse: false)!
    .replacingOccurrences(of: "\\N", with: "")
    .components(separatedBy: CharacterSet(charactersIn: "{}"))
    .filter { $0 != "" }





