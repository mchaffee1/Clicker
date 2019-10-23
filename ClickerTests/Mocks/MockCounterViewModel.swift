import Foundation

@testable import Clicker

class MockCounterViewModel: CounterViewModelType {
    var mockCount = 0
    var countTextGetCount = 0
    var countText: String {
        get {
            self.countTextGetCount += 1
            return String(mockCount)
        }
    }

    var tapCallCount = 0
    func tap() {
        tapCallCount += 1
    }
}
