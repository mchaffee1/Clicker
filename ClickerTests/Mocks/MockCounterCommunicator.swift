import Foundation

@testable import Clicker

class MockCounterCommunicator: CounterCommunicatorType {
    var mockCountValue = 0
    var loadCountCallCount = 0
    func loadCount(completionHandler: @escaping CounterCommunicator.ResultHandler<Int>) {
        loadCountCallCount += 1
        completionHandler(.success(mockCountValue))
    }

    var saveCalls = [Int]()
    func save(count: Int) {
        saveCalls.append(count)
    }
}
