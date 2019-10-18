import Foundation
import XCTest

@testable import Clicker

class CounterTests: XCTestCase {
    var mockCounterView: MockCounterView!
    
    var counterLogicController: CounterLogicController!
    var counterViewModel: CounterViewModel!
    
    override func setUp() {
        mockCounterView = MockCounterView()
        counterLogicController = CounterLogicController.shared
        
        counterViewModel = CounterViewModel(view: mockCounterView)
    }
    
    func testShouldIncrementCountOnTap() {
        counterViewModel.tap()
        
        XCTAssertEqual(1, mockCounterView.showDataCallCount)
        XCTAssertEqual("1", counterViewModel.countText)
    }
}
