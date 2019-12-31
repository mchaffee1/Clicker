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
        initializeRepositoryFromApi()
    }

    fileprivate func initializeRepositoryFromApi() {
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
        let newValue = 1 + counterRepository.get()
        counterRepository.set(newValue: newValue)
        counterCommunicator.save(count: newValue)
    }
}
