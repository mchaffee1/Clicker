import Foundation

class Dependencies: CounterViewModelProviderType {
    static let shared: CounterViewModelProviderType = Dependencies()

    // TODO this, generically
    func buildCounterViewModel(for counterView: CounterViewType?) -> CounterViewModelType {
        let result = MockCounterViewModel.shared
        result.counterView = counterView
        return result
    }
}
