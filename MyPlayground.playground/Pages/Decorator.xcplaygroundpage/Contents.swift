import Foundation

protocol Service {
    func load(completion: @escaping (String) -> Void)
}

final class AsyncService: Service {
    func load(completion: @escaping (String) -> Void) {
        DispatchQueue.global()
            .asyncAfter(deadline: .now() + .seconds(2)) {
                completion("Hellow World!")
            }
    }
}

final class MainQueueDispatchDecorator: Service {
    let decoratee: Service

    init(
        decoratee: Service
    ) {
        self.decoratee = decoratee
    }

    func load(completion: @escaping (String) -> Void) {
        decoratee.load { result in
            guranteeMainThread {
                completion(result)
            }
        }
    }
}

func guranteeMainThread(_ work: @escaping () -> Void) {
    if Thread.isMainThread {
        work()
    }
    else {
        DispatchQueue.main.async(execute: work)
    }
}
