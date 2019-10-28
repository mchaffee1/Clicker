import Foundation
import XCTest

@testable import Clicker

/*
 So here's a very simple headless functional test.  What we do is stand up the whole application
 (using a real Dependencies instance) and then use a mock view to interact with a real view model.
 If we were testing a userflow that included an API call, then we'd also want to mock that API
 (using an external tool like Mountebank) and configure the headless app to call the mock instead of the real API
 (ideally that would be a config, rather than a code, difference).
 */

class CounterTests: XCTestCase {
    var dependencies: DependenciesType!
    
    var mockCounterView: MockCounterView!
    
    var counterViewModel: CounterViewModelType!
    
    override func setUp() {
        dependencies = Dependencies()
        mockCounterView = MockCounterView()
        
        counterViewModel = dependencies.buildCounterViewModel(for: mockCounterView)
    }
    
    func testShouldIncrementCountOnTap() {
        XCTAssertEqual("0", counterViewModel.countText, "The app should launch showing a count of zero")

        counterViewModel.tap()
        
        XCTAssertEqual(1, mockCounterView.showDataCallCount, "After one tap, the view should have been evented once")
        XCTAssertEqual("1", counterViewModel.countText, "After one tap, the app should show a count of one")

        counterViewModel.tap()
        
        XCTAssertEqual(2, mockCounterView.showDataCallCount, "After a second tap, the view should have been evented twice")
        XCTAssertEqual("2", counterViewModel.countText, "After a second tap, the view should show a count of two")
    }
}
