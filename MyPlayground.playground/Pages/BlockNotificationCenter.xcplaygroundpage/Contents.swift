import Foundation

final class BlockNotificationCenter {

    var action: (() -> Void)? = nil

    func addNotification(name: Notification.Name) {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(foo),
            name: name,
            object: nil
        )
    }

    @objc
    func foo() {
        action?()
    }
}

let blockN = BlockNotificationCenter()
blockN.action = {
    print("here")
}
blockN.addNotification(name: Notification.Name(rawValue: "Foo"))

NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "Foo")))
NotificationCenter.default.post(Notification(name: Notification.Name(rawValue: "Foo")))
