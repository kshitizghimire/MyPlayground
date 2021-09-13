import XCTest

final class ViewController: UIViewController {
    private(set) lazy var addButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapAddButton), for: .touchUpInside)

        return button
    }()

    // MARK: - Actions
    var didTapAdd: (() -> Void)?
    @objc private func tapAddButton() {
        didTapAdd?()
    }
}

final class ViewControllerTests: XCTestCase {

    func testAction() {
        let expectation = expectation(description: #function)
        let viewController = ViewController()
        viewController.didTapAdd = {
            expectation.fulfill()
        }

        viewController.addButton.sendActions(for: .touchUpInside)

        wait(for: [expectation], timeout: 0.1)

    }
}

ViewControllerTests.defaultTestSuite.run()
