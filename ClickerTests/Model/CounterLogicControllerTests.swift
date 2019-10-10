import Foundation
import XCTest

@testable import Clicker

class CounterLogicControllerTests: XCTestCase {
    var counterLogicController: CounterLogicController!

    override func setUp() {
        super.setUp()
        counterLogicController = CounterLogicController()
    }

    func testShouldInitializeToZero() {
        XCTAssertEqual(0, counterLogicController.get())
    }
}
