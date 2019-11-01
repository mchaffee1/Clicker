import Foundation

@testable import Clicker

class MockCounterLogicController: CounterLogicControllerType {
    var mockGetValue = 0
    var getCallCount = 0
    func get() -> Int {
        getCallCount += 1
        return mockGetValue
    }

    var decreaseCallCount = 0
    func decrease() {
        decreaseCallCount += 1
    }
    var incrementCallCount = 0
    func increment() {
        incrementCallCount += 1
    }
}
