import Foundation

@testable import Clicker

class MockCounterViewModel: CounterViewModelType {
    var countText: String = ""

    var tapCallCount = 0
    func tap() {
        tapCallCount += 1
    }
}
