import Foundation

protocol CounterViewModelProviderType {
    static var shared: CounterViewModelProviderType { get }
    func buildCounterViewModel(for: CounterViewType?) -> CounterViewModelType
}
