import Foundation

@testable import Clicker

class MockCounterLogicController: CounterLogicControllerType {
    var mockGet = 0
    var getCallCount = 0
    func get() -> Int {
        getCallCount += 1
        return mockGet
    }

    var mockIncrement = 0
    var incrementCallCount = 0
    func increment() -> Int {
        incrementCallCount += 1
        return mockIncrement
    }
}
