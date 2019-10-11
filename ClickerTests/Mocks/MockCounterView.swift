import Foundation

@testable import Clicker

class MockCounterView: CounterViewType {
    var showDataCallCount = 0
    var showDataFromViewModel: CounterViewModelType?
    func showData(from viewModel: CounterViewModelType) {
        showDataCallCount += 1
        showDataFromViewModel = viewModel
    }
}
