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
    let counterLogicController: CounterLogicControllerType
    weak var view: CounterViewType?

    var countText: String {
        return String(counterLogicController.get())
    }

    func tap() {
        counterLogicController.increment()
        notifyView()
    }

    func swipeDown() {
        counterLogicController.decrease()
        notifyView()
    }
    
    private func notifyView() {
        view?.showData(from: self)
    }
    
    init(view: CounterViewType?,
         logicController: CounterLogicControllerType = CounterLogicController.shared) {
        self.view = view
        self.counterLogicController = logicController
    }
}
