import Foundation

class MockCounterViewModel: CounterViewModelType {
    static let shared = MockCounterViewModel()

    var counterView: CounterViewType?

    var count = 42
    var countText: String {
        return "\(count)"
    }

    var tapCallCount = 0
    func tap() {
        count += 1
        tapCallCount += 1
        counterView?.showData(from: self)
    }
}
