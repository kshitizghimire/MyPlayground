import XCTest

protocol ViewModelProtocol {
    func addFruit(_ text: String)
}

class MockViewModel: ViewModelProtocol {
    var addFruitCalled = 0
    var didCallAddFruit: ((Int) -> Void)?
    func addFruit(_ text: String) {
        addFruitCalled += 1
        didCallAddFruit?(addFruitCalled)
    }
}

final class ViewModelTests: XCTestCase {

    func testAction() {
        let viewModel = MockViewModel()

        let expectation = expectation(description: #function)
        XCTAssertEqual(viewModel.addFruitCalled, 0)
        viewModel.didCallAddFruit = { counter in
            XCTAssertEqual(counter, 1)
            expectation.fulfill()
        }

        viewModel.addFruit("Mango")

        wait(for: [expectation], timeout: 0.1)
    }
}

ViewModelTests.defaultTestSuite.run()
