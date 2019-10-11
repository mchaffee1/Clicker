import Foundation
import XCTest

@testable import Clicker

class CounterViewModelTests: XCTestCase {
    var counterViewModel: CounterViewModel!
    var mockCounterLogicController: MockCounterLogicController!
    var mockCounterView: MockCounterView!

    override func setUp() {
        super.setUp()
        mockCounterView = MockCounterView()
        mockCounterLogicController = MockCounterLogicController()
        counterViewModel = CounterViewModel(view: mockCounterView, logicController: mockCounterLogicController)
    }

    func testShouldInitializeWithZeroText() {
        let randomNumber = Int.random(in: 0...Int.max)
        mockCounterLogicController.mockGet = randomNumber

        XCTAssertEqual(String(randomNumber), counterViewModel.countText)
    }

    func testShouldIncrementOnTapAndReportBack() {
        counterViewModel.tap()

        XCTAssertEqual(1, mockCounterLogicController.incrementCallCount)
        XCTAssertEqual(1, mockCounterView.showDataCallCount)
    }
}
