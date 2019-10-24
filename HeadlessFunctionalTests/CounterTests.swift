import Foundation
import XCTest

@testable import Clicker

class CounterTests: XCTestCase {
    var dependencies: DependenciesType!
    
    var mockCounterView: MockCounterView!
    
    var counterViewModel: CounterViewModelType!
    
    override func setUp() {
        dependencies = Dependencies()
        mockCounterView = MockCounterView()
        
        counterViewModel = dependencies.getCounterViewModel(for: mockCounterView)
    }
    
    func testShouldIncrementCountOnTap() {
        XCTAssertEqual("0", counterViewModel.countText)

        counterViewModel.tap()
        
        XCTAssertEqual(1, mockCounterView.showDataCallCount)
        XCTAssertEqual("1", counterViewModel.countText)
    }
}
