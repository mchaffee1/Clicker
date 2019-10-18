import Foundation
import XCTest

@testable import Clicker

class MockCounterRepository: CounterRepositoryType {
    var mockGetValue = 0
    func get() -> Int {
        return mockGetValue
    }

    var setCalls = [Int]()
    func set(newValue: Int) {
        setCalls.append(newValue)
    }
}
