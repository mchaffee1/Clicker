import Foundation

protocol CounterLogicControllerType {
    func get() -> Int
    func increment()
}

protocol CounterRepositoryType {
    func get() -> Int
    func set(newValue: Int)
}

class CounterLogicController: CounterLogicControllerType {
    public static let shared = CounterLogicController()

    private let counterRepository: CounterRepositoryType

    init(counterRepository: CounterRepositoryType = InMemoryCounterRepository()) {
        self.counterRepository = counterRepository
    }

    func get() -> Int {
        return counterRepository.get()
    }

    func increment() {
        let currentValue = counterRepository.get()
        counterRepository.set(newValue: 1 + currentValue)
    }
}
