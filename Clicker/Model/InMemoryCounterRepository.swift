import Foundation

class InMemoryCounterRepository: CounterRepositoryType {
    func get() -> Int {
        return value
    }
    
    func set(newValue: Int) {
        value = newValue
    }
    
    private var value: Int = 0
}
