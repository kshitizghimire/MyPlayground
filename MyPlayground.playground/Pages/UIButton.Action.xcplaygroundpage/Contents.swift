import UIKit

class Button: NSObject {
    let title: String
    let action: (UIButton) -> Void

    private let button: UIButton

    init(
        title: String,
        action: @escaping (UIButton) -> Void
    ) {
        self.title = title
        self.action = action
        button = UIButton(frame: .zero)

        super.init()

        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        print(sender)
    }
}

let action: (UIButton) -> Void = { _ in
    print("here")
}

let button = Button(title: "Hello", action: action)
action(UIButton())
