import Foundation

struct CounterViewModel: CounterViewModelType {
    let counterLogicController: CounterLogicControllerType
    weak var view: CounterViewType?

    var countText: String {
        return String(counterLogicController.get())
    }

    func tap() {
        counterLogicController.increment()
        view?.showData(from: self)
    }

    init(view: CounterViewType?,
         logicController: CounterLogicControllerType = CounterLogicController.shared) {
        self.view = view
        self.counterLogicController = logicController
    }
}
