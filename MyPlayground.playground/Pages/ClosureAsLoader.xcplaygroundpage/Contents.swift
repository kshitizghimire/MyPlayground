import UIKit

struct Foo {}
protocol load {
    func l(completion: @escaping ([Foo]) -> Void)
}

typealias Loader = (@escaping ([Foo]) -> Void) -> Void

class Viewcontroller: UIViewController {
    let load: Loader

    init(load: @escaping Loader) {
        self.load = load
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        load { foos in
            foos.forEach { foo in
                print(foo)
            }
        }
    }
}

let vc = Viewcontroller { complition in
    complition(
        [
            Foo(),
            Foo(),
            Foo(),
        ]
    )
}

vc.loadViewIfNeeded()
