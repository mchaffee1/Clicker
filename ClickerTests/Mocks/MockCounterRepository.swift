import Foundation
import XCTest

@testable import Clicker

class MockCounterRepository: CounterRepositoryType {
    var getCallCount = 0
    var mockGetValue = 0
    func get() -> Int {
        getCallCount += 1
        return mockGetValue
    }

    var setCalls = [Int]()
    func set(newValue: Int) {
        setCalls.append(newValue)
    }
}
