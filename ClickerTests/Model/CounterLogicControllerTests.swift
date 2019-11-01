import Foundation
import XCTest

@testable import Clicker

class CounterLogicControllerTests: XCTestCase {
    var counterLogicController: CounterLogicController!
    var mockCounterRepository: MockCounterRepository!
    var randomInt: Int!

    override func setUp() {
        super.setUp()
        randomInt = Int.random(in: Int.min...Int.max)
        mockCounterRepository = MockCounterRepository()
        mockCounterRepository.mockGetValue = randomInt // stick a random number into the repository count value
        
        counterLogicController = CounterLogicController(counterRepository: mockCounterRepository)
    }

    func testShouldInitializeToRepositoryValue() {
        XCTAssertEqual(randomInt, counterLogicController.get(), "Logic controller should return the count value from repository.get()")
    }
    
    func testShouldSetIncrementedRepositoryValue() {
        counterLogicController.increment()
        XCTAssertEqual(1 + randomInt, mockCounterRepository.setCalls.last, "Logic controller should increment the repository count value")
    }
    
    func testShouldSetDecreasedRepositoryValue() {
        counterLogicController.decrease()
        XCTAssertEqual(randomInt - 1, mockCounterRepository.setCalls.last, "Logic controller should increment the repository count value")
    }
}
