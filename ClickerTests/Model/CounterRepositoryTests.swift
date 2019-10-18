import Foundation
import XCTest

@testable import Clicker

class CounterRepositoryTests: XCTestCase {
    var counterRepository: CounterRepositoryType!
    
    override func setUp() {
        counterRepository = InMemoryCounterRepository()
    }
    
    func testShouldStoreAndReturnSameValue() {
        let randomInt = Int.random(in: Int.min...Int.max)
        
        counterRepository.set(newValue: randomInt)
        
        XCTAssertEqual(randomInt, counterRepository.get())
    }
}
