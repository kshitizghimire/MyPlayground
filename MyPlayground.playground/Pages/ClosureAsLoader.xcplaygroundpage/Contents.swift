import UIKit

struct Foo {}
protocol Loading {
    func load(completion: @escaping ([Foo]) -> Void)
}

typealias Loader = (@escaping ([Foo]) -> Void) -> Void

class Viewcontroller: UIViewController {
    let loader: Loader

    init(loader: @escaping Loader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        loader { foos in
            foos.forEach { foo in
                print(foo)
            }
        }
    }
}

let vc = Viewcontroller { complition in
    complition([Foo(), Foo(), Foo()])
}

vc.loadViewIfNeeded()

struct LoaderAsType: Loading {
    func load(completion: @escaping ([Foo]) -> Void) {
        completion([Foo(), Foo(), Foo(), Foo(), Foo(), Foo()])
    }
}

let vcWithLoaderAsType = Viewcontroller(loader: LoaderAsType().load)
vcWithLoaderAsType.loadViewIfNeeded()
