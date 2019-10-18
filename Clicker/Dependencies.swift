import Foundation

protocol DependenciesType {
    var counterLogicController: CounterLogicControllerType { get }
    func getCounterViewModel() -> CounterViewModelType
}

class Dependencies: DependenciesType {
    public static let shared = Dependencies()

    let counterLogicController: CounterLogicControllerType = CounterLogicController()

    func getCounterViewModel() -> CounterViewModelType {
        return CounterViewModel(view: nil, logicController: self.counterLogicController)
    }
}
