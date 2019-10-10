import Foundation
import XCTest

@testable import Clicker

class CounterViewModelTests: XCTestCase {
    var counterViewModel: CounterViewModel!
    var mockCounterLogicController: MockCounterLogicController!

    override func setUp() {
        super.setUp()
        mockCounterLogicController = MockCounterLogicController()
        counterViewModel = CounterViewModel(view: nil, logicController: mockCounterLogicController)
    }

    func testShouldInitializeWithZeroText() {
        let randomNumber = Int.random(in: 0...Int.max)
        mockCounterLogicController.mockGet = randomNumber

        XCTAssertEqual(String(randomNumber), counterViewModel.countText)
    }

    func testShouldIncrementOnTap() {
        counterViewModel.tap()

        XCTAssertEqual(1, mockCounterLogicController.incrementCallCount)
    }
}
