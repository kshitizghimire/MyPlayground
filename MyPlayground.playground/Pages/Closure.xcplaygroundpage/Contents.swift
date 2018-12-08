
import UIKit
import os.log


let addClosure = { (_ number1: Int, number2: Int) -> Int in
    return number1 + number2 }



let result = addClosure(3, 4)


class Solution: CustomDebugStringConvertible {
    var debugDescription: String {
        return "string\(closure)"
    }
    
    
    let closure: (_ input: String) -> String
    
    init(closure: @escaping (_ input: String) -> String) {
        self.closure = closure
    }
}


let solution = Solution(closure: { (_ input: String) -> String in
    return "Input value is \(input)"
})
solution.closure("10")

print(solution)
