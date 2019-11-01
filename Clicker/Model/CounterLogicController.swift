import Foundation

protocol CounterLogicControllerType {
    func get() -> Int
    func increment()
    func decrease()
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
        storeValueChange { $0 + 1 }
    }

    func decrease() {
        storeValueChange { $0 - 1 }
    }
    
    private func storeValueChange(transform: (Int)->(Int)) {
        let oldValue = counterRepository.get()
        let newValue = transform(oldValue)
        counterRepository.set(newValue: newValue)
    }
}
