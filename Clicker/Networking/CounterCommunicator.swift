import Foundation

protocol CounterCommunicatorType: CommunicatorType {
    func loadCount(completionHandler: @escaping ResultHandler<Int>)
    func save(count: Int)
}

class CounterCommunicator: CounterCommunicatorType {
    let counterPath = "http://localhost:8080/counter"

    func loadCount(completionHandler: @escaping ResultHandler<Int>) {
        get(path: counterPath) { (countResult: Result<Count, Error>) in
            completionHandler(countResult.map { $0.count })
        }
    }

    func save(count: Int) {
        // TODO make work
    }
}

protocol CommunicatorType {
}

extension CommunicatorType {
    typealias ResultHandler<T> = (Result<T, Error>) -> ()

    func get<ResultType: Decodable>(path: String, completionHandler: @escaping ResultHandler<ResultType>) {
        guard let url = URL(string: path) else {
            fatalError("could not instantiate url")
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                let resultValue = try? JSONDecoder().decode(ResultType.self, from: data) else {
                // TODO error handling 😂
                    completionHandler(Result.failure(error ?? NSError(domain: "Couldn't even get an error", code: -1, userInfo: nil)))
                return
            }
            completionHandler(Result.success(resultValue))
        }.resume()
    }
}
