import Foundation

protocol FooDelegate: AnyObject {
    func success()
    func failure()
}

class FooDelegateImpl1: FooDelegate {
    func success() {
        print("success 1")
    }

    func failure() {}
}

class FooDelegateImpl2: FooDelegate {
    func success() {
        print("success 2")
    }

    func failure() {}
}

class FooDelegateComposition: FooDelegate {
    private var delegates: [FooDelegate] = []

    func addDelegate(_ delegate: FooDelegate) {
        delegates.append(delegate)
    }

    func success() {
        delegates.forEach {
            $0.success()
        }
    }

    func failure() {
        delegates.forEach {
            $0.failure()
        }
    }
}

class FooClass {
    weak var delegate: FooDelegate!

    func success() {
        delegate.success()
    }
}

//
let foo = FooClass()

let fooDelegateComposition = FooDelegateComposition()
fooDelegateComposition.addDelegate(FooDelegateImpl1())
fooDelegateComposition.addDelegate(FooDelegateImpl2())

foo.delegate = fooDelegateComposition
foo.success()
