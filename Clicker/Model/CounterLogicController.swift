import Foundation

protocol CounterLogicControllerType {
    func get() -> Int
    func increment() -> Int
}

class CounterLogicController: CounterLogicControllerType {
    public static let shared = CounterLogicController()

    func get() -> Int {
        return 0
    }

    func increment() -> Int {
        return 0
    }
}
