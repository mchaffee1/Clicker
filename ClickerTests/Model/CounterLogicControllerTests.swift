import Foundation
import XCTest

@testable import Clicker

class CounterLogicControllerTests: XCTestCase {
    var counterLogicController: CounterLogicController!
    var mockCounterRepository: MockCounterRepository!
    var mockRepositoryCount: Int!
    var mockCounterCommunicator: MockCounterCommunicator!
    var mockAPICount: Int!

    override func setUp() {
        super.setUp()
        mockRepositoryCount = Int.random(in: Int.min...Int.max)
        mockCounterRepository = MockCounterRepository()
        mockCounterRepository.mockGetValue = mockRepositoryCount // stick a random number into the repository count value

        mockAPICount = Int.random(in: Int.min...Int.max)
        mockCounterCommunicator = MockCounterCommunicator()
        mockCounterCommunicator.mockCountValue = mockAPICount

        counterLogicController = CounterLogicController(counterRepository: mockCounterRepository, counterCommunicator: mockCounterCommunicator)
    }

    func testShouldInitializeToRepositoryValue() {
        let expectedCallCount = 1 + mockCounterRepository.getCallCount
        XCTAssertEqual(mockRepositoryCount, counterLogicController.get(), "Logic controller should return the count value from counterRepository.get()")
        XCTAssertEqual(mockCounterRepository.getCallCount, expectedCallCount, "Logic controller should call counterRepository.get() once")
    }
    
    func testShouldSetIncrementedRepositoryValueAndStoreInAPI() {
        let newCount = 1 + mockCounterRepository.get()
        counterLogicController.increment()
        XCTAssertEqual(mockCounterRepository.setCalls.last, newCount, "Logic controller should increment the repository count value")
        XCTAssertEqual(mockCounterCommunicator.saveCalls, [newCount])
    }

    func testShouldGetAndStoreInitialValueOnLaunch() {
        // No action at this time - we just launch, let everything sort out, and then hope for the best
        Thread.sleep(forTimeInterval: 0.01)
        XCTAssertEqual(mockCounterCommunicator.loadCountCallCount, 1)
        XCTAssertEqual(mockCounterRepository.setCalls.last, mockAPICount)
        XCTAssertEqual(mockCounterRepository.setCalls.count, 1)
    }
}
