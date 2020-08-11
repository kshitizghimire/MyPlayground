//: [Previous](@previous)

import Foundation

let a = DispatchTime.now()
let b = DispatchTime.now()
print(b.uptimeNanoseconds-a.uptimeNanoseconds)

CFAbsoluteTimeGetCurrent
