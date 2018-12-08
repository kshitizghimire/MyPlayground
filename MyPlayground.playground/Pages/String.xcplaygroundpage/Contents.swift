
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
    print(c)
}

for c in flowers.utf8 {
    print(c)
}

for c in flowers.unicodeScalars {
    print(c)
}
