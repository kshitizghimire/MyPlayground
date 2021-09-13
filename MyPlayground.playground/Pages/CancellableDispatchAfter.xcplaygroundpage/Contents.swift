import Foundation

final class CancellableDispatchAfter {
    var cancel: Bool = false
    let dispathcQueue: DispatchQueue

    init(
        dispathcQueue: DispatchQueue
    ) {
        self.dispathcQueue = dispathcQueue
    }

    func dispatchAfter(deadline: DispatchTime, work: @escaping () -> Void) {
        dispathcQueue.asyncAfter(deadline: deadline) {
            if !self.cancel {
                work()
            }
        }
    }
}

let cancel = CancellableDispatchAfter(dispathcQueue: DispatchQueue.main)
cancel.dispatchAfter(deadline: .now() + .seconds(3)) {
    print("cancelled")
}
cancel.cancel = true

let execute = CancellableDispatchAfter(dispathcQueue: DispatchQueue.main)
execute.dispatchAfter(deadline: .now() + .seconds(3)) {
    print("executed")
}
