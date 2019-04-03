//: [Previous](@previous)

import Foundation

#if swift(>=5.0)
print("Hello, Swift 5.0")
#elseif swift(>=4.1)
print("Hello, Swift 4.1")
#elseif swift(>=4.0)
print("Hello, Swift 4.0")
#elseif swift(>=3.0)
print("Hello, Swift 3.x")
#else
print("Hello, Swift 2.2")
#endif


let a:DictionaryLiteral<String, String>
