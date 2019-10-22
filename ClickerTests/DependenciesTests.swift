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
    }
}
