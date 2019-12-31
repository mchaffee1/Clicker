import Foundation

@testable import Clicker

class MockCounterCommunicator: CounterCommunicatorType {
    var mockCountValue = 0
    var loadCountCallCount = 0
    func loadCount(completionHandler: @escaping CounterCommunicator.ResultHandler<Int>) {
        loadCountCallCount += 1
        completionHandler(.success(mockCountValue))
    }

    var mockSuccessResult: Any = "Success"
    var saveCalls = [Int]()
    func save(count: Int, completionHandler: @escaping (Result<Any, Error>) -> ()) {
        saveCalls.append(count)
        completionHandler(Result.success(mockSuccessResult))
    }
}
