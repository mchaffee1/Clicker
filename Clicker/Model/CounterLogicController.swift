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
    private let counterCommunicator: CounterCommunicatorType

    init(counterRepository: CounterRepositoryType = InMemoryCounterRepository(),
         counterCommunicator: CounterCommunicatorType = CounterCommunicator()) {
        self.counterRepository = counterRepository
        self.counterCommunicator = counterCommunicator
        storeApiValueInRepository()
    }

    fileprivate func storeApiValueInRepository() {
        counterCommunicator.loadCount { result in
            switch result {
            case .success(let value):
                self.counterRepository.set(newValue: value)
            default:
                print(result)
            }
            // TODO add error handling
        }
    }

    func get() -> Int {
        return counterRepository.get()
    }

    func increment() {
        let currentValue = counterRepository.get()
        counterRepository.set(newValue: 1 + currentValue)
        // TODO POST updates to API (here?)
    }
}
