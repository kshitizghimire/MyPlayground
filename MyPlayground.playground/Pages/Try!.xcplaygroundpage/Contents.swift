import Foundation

let string = "abcdef"

var subString = [Substring]()

var i = string.startIndex
while i < string.endIndex {
    var j = i
    while j < string.endIndex {
        subString.append(string[i...j])
        j = string.index(after: j)
    }
    i = string.index(after: i)
}

print(subString)
