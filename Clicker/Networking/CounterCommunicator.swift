import Foundation

protocol CounterCommunicatorType: CommunicatorType {
    func loadCount(completionHandler: @escaping ResultHandler<Int>)
    func save(count: Int, completionHandler: @escaping (Result<Any, Error>)->())
}

class CounterCommunicator: CounterCommunicatorType {
    let counterPath = "http://localhost:8080/counter"

    func loadCount(completionHandler: @escaping ResultHandler<Int>) {
        get(path: counterPath) { (countResult: Result<Count, Error>) in
            completionHandler(countResult.map { $0.count })
        }
    }

    func save(count: Int, completionHandler: @escaping (Result<Any, Error>)->()) {
        post(path: counterPath, value: Count(count: count)) { result in completionHandler(result) }
    }
}
