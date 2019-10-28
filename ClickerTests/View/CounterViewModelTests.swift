import Foundation
import XCTest

@testable import Clicker

class CounterViewModelTests: XCTestCase {
    var counterViewModel: CounterViewModel!
    var mockCounterLogicController: MockCounterLogicController!
    var mockCounterView: MockCounterView!
    var randomInt: Int!

    override func setUp() {
        super.setUp()
        randomInt = Int.random(in: Int.min...Int.max)
        
        mockCounterView = MockCounterView()
        mockCounterLogicController = MockCounterLogicController()
        counterViewModel = CounterViewModel(view: mockCounterView, logicController: mockCounterLogicController)
    }

    func testShouldInitializeWithZeroText() {
        mockCounterLogicController.mockGetValue = randomInt

        XCTAssertEqual(String(randomInt), counterViewModel.countText, "ViewModel should display a string of the logic controller count")
    }

    func testShouldIncrementOnTapAndReportBack() {
        mockCounterLogicController.mockGetValue = randomInt
        
        counterViewModel.tap()

        XCTAssertEqual(1, mockCounterLogicController.incrementCallCount, "On tap, ViewModel should call logic controller increment()")
        XCTAssertEqual(1, mockCounterView.showDataCallCount, "On tap, ViewModel should call view's showData(from:)")
    }
}
