import Foundation

extension CounterViewModelProviderType {
    static var shared: CounterViewModelProviderType {
        return Dependencies.shared
    }
}
