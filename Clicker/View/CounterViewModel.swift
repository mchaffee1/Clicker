import Foundation

protocol CounterViewModelType {
    var countText: String { get }
    func tap()
    func swipeDown()
}

protocol CounterViewType: class {
    func showData(from: CounterViewModelType)
}

struct CounterViewModel: CounterViewModelType {
    func swipeDown() {
        // TODO wire to LogicController
    }
    
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
