import Foundation

protocol DependenciesType {
    var counterLogicController: CounterLogicControllerType { get }
}

class Dependencies: DependenciesType {
    public static let shared = Dependencies()

    let counterLogicController: CounterLogicControllerType = CounterLogicController()
}
