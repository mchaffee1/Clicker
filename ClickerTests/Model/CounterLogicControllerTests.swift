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
        mockCounterRepository.mockGetValue = randomInt
        
        counterLogicController = CounterLogicController(counterRepository: mockCounterRepository)
    }

    func testShouldInitializeToRepositoryValue() {
        XCTAssertEqual(randomInt, counterLogicController.get())
    }
    
    func testShouldSetIncrementedRepositoryValue() {
        counterLogicController.increment()
        XCTAssertEqual(1 + randomInt, mockCounterRepository.setCalls.last)
    }
}
