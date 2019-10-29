
import Foundation
import XCTest

@testable import Clicker

class CounterPageViewControllerTests: XCTestCase {
    var mockCounterViewModel: MockCounterViewModel!
    var counterPageViewController: CounterPageViewController!
    var mockDependencies: MockDependencies!
    var mockLabel: MockUILabel!

    override func setUp() {
        super.setUp()
        mockLabel = MockUILabel()
        counterPageViewController = CounterPageViewController()
        mockDependencies = MockDependencies()
        mockCounterViewModel = mockDependencies.mockCounterViewModel
        counterPageViewController.dependencies = mockDependencies
        counterPageViewController.countLabel = mockLabel
    }

    func testShouldGetAndDisplayViewModelCountOnLoad() {
        let randomInt = Int.random(in: 0...100)
        mockCounterViewModel.mockCount = randomInt
        
        counterPageViewController.viewDidLoad()
        
        XCTAssertEqual(String(randomInt), mockLabel.text)
    }
    
    func testShouldCallViewModelOnTap() {
        counterPageViewController.viewDidLoad()

        counterPageViewController.tap(UITapGestureRecognizer())

        XCTAssertEqual(1, mockCounterViewModel.tapCallCount)
    }
    
    func testShouldCallViewModelOnSwipeDown() {
        counterPageViewController.viewDidLoad()

        counterPageViewController.swipeDown(UISwipeGestureRecognizer())

        XCTAssertEqual(1, mockCounterViewModel.swipeDownCallCount)
    }
}
