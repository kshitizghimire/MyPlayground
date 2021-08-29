//: [Previous](@previous)

import Foundation

class CancellableDispatchAfter {
    var cancel: Bool = false
    let dispathcQueue: DispatchQueue

    init(
        dispathcQueue: DispatchQueue
    ) {
        self.dispathcQueue = dispathcQueue
    }

    func dispatchAfter(after: Int, closure: @escaping () -> Void) {
        dispathcQueue.asyncAfter(deadline: .now() + .seconds(after)) {
            if !self.cancel {
                closure()
            }
            else {
                print("cancelled")
            }
        }
    }
}

let cancellable = CancellableDispatchAfter(dispathcQueue: DispatchQueue.main)
cancellable.dispatchAfter(after: 3) {
    print("abc")
}
cancellable.cancel = true
