import Foundation

let template = "<<<Hello>>>"
let indexStartOfText = template.index(template.startIndex, offsetBy: 3)
let indexEndOfText = template.index(template.endIndex, offsetBy: -4)

let indexFirst = indexStartOfText...
print(indexFirst.lowerBound)
print(template[indexStartOfText...])

let index = ...indexEndOfText
print(index.upperBound)
print(template[...indexEndOfText])

let flowers = "Flowers 💐"
for c in flowers {
    print(c, type(of: c))
}

for c in flowers.utf8 {
    print(c)
}

for c in flowers.unicodeScalars {
    print(c, type(of: c))
}

let s = " abcd"

s[s.index(s.startIndex, offsetBy: 2)]

for alphabet in Unicode.Scalar("A").value ... Unicode.Scalar("Z").value {
    print(alphabet, Int(Unicode.Scalar(alphabet)!.value), Unicode.Scalar(alphabet)!)

    let c = Character(Unicode.Scalar(alphabet)!)
    print(c, type(of: c))
    let s = String(Unicode.Scalar(alphabet)!)
    print(s, type(of: s))
}

for c in Unicode.Scalar("A").value ... Unicode.Scalar("Z").value {
    print(Unicode.Scalar(c)!)
}
