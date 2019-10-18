
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
//        counterPageViewController.viewModel = mockCounterViewModel
    }

    func testShouldGetAndDisplayViewModelCountOnLoad() {
        counterPageViewController.viewDidLoad()
        
        XCTAssertEqual(1, mockCounterViewModel.countTextGetCount)
    }
    
    func testShouldCallViewModelOnTap() {
//        counterPageViewController.tap(UITapGestureRecognizer())
//
//        XCTAssertEqual(1, mockCounterViewModel.tapCallCount)
    }
}
