import Foundation
import XCTest

@testable import Clicker

class DependenciesTests: XCTestCase {
    var dependencies: Dependencies!

    override func setUp() {
        super.setUp()
        
        dependencies = Dependencies()
    }
    
    func testShouldWireUpCounterViewModel() {
        let mockView = MockCounterView()
        
        let viewModel = dependencies.buildCounterViewModel(for: mockView)
        viewModel.tap()
        
        XCTAssertEqual(1, mockView.showDataCallCount)
    }
}
