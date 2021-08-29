//: [Previous](@previous)

import Foundation

let operationQueue = OperationQueue()

let blockOperation = BlockOperation {
    print("Block opertion")
}
blockOperation.queuePriority = .veryLow

class CustomOperation: Operation {
    override func main() {
        print("Operation")
    }
}
let custom = CustomOperation()
custom.queuePriority = .veryHigh
operationQueue.addOperations([blockOperation, custom], waitUntilFinished: false)
