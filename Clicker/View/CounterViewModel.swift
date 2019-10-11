import Foundation

protocol CounterViewModelType {
    var countText: String { get }
    func tap()
}

protocol CounterViewType: class {
    func showData(from: CounterViewModelType)
}

struct CounterViewModel: CounterViewModelType {
    let counterLogicController: CounterLogicControllerType
    weak var view: CounterViewType?

    var countText: String {
        return String(counterLogicController.get())
    }

    func tap() {
        _ = counterLogicController.increment()
        view?.showData(from: self)
    }

    init(view: CounterViewType?,
         logicController: CounterLogicControllerType = CounterLogicController.shared) {
        self.view = view
        self.counterLogicController = logicController
    }
}
