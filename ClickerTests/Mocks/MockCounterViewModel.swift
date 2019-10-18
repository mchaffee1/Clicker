import Foundation

@testable import Clicker

class MockCounterViewModel: CounterViewModelType {
    var countTextGetValue = 0
    var countTextGetCount = 0
    var countText: String {
        get {
            countTextGetCount += 1
            return String(countTextGetValue)
        }
    }

    var tapCallCount = 0
    func tap() {
        tapCallCount += 1
    }
}
