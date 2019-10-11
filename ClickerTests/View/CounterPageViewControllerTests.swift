
import Foundation
import XCTest

@testable import Clicker

class CounterPageViewControllerTests: XCTestCase {
    var mockCounterViewModel: MockCounterViewModel!
    var counterPageViewController: CounterPageViewController!

    override func setUp() {
        super.setUp()
        mockCounterViewModel = MockCounterViewModel()
        counterPageViewController = CounterPageViewController()
    }

    func testShouldCallViewModelOnTap() {

    }
}
