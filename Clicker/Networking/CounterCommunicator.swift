import Foundation
import Alamofire

protocol CounterCommunicatorType: CommunicatorType {
    func loadCount(completionHandler: @escaping ResultHandler<Int>)
    func save(count: Int)
}

class CounterCommunicator: CounterCommunicatorType {
    func save(count: Int) {
        // TODO make work
    }

    let counterPath = "http://localhost:8080/counter"

    func loadCount(completionHandler: @escaping ResultHandler<Int>) {
        get(path: counterPath) { (countResult: Swift.Result<Count, Error>) in
            completionHandler(countResult.map { $0.count })
        }
    }
}

protocol CommunicatorType {
    func processFailure<T>(dataResponse: DataResponse<Any>, completionHandler: @escaping ResultHandler<T>) -> Bool

    func getFailureResult<T>(for response: DataResponse<Any>, message: String) -> Swift.Result<T, Error>
}

extension CommunicatorType {
    typealias ResultHandler<T> = (Swift.Result<T, Error>) -> ()

    func get<ResultType: Decodable>(path: String, completionHandler: @escaping ResultHandler<ResultType>) {
        Alamofire.request(path, method: .get)
            .responseJSON { dataResponse in
                guard !self.processFailure(dataResponse: dataResponse, completionHandler: completionHandler) else {
                    return
                }
                do {
                    guard let data = dataResponse.data else {
                        completionHandler(self.getFailureResult(for: dataResponse, message: "could not extract data"))
                        return
                    }
                    let resultValue = try JSONDecoder().decode(ResultType.self, from: data)
                    completionHandler(Swift.Result.success(resultValue))
                } catch {
                    completionHandler(Swift.Result.failure(error))
                }
        }
    }

    func userInfo<T>(from response: DataResponse<T>) -> [String: Any] {
        return ["dataResponse": response]
    }

    func processFailure<T>(dataResponse: DataResponse<Any>, completionHandler: @escaping ResultHandler<T>) -> Bool {
        guard dataResponse.result.isFailure else {
            return false
        }
        let defaultError = NSError(domain: "Could not get result code", code: -1, userInfo: userInfo(from: dataResponse))
        let error = dataResponse.result.error ?? defaultError
        completionHandler(Swift.Result.failure(error))
        return true
    }

    func getFailureResult<T>(for response: DataResponse<Any>, message: String)  -> Swift.Result<T, Error> {
        let error = NSError(domain: message, code: -1, userInfo: userInfo(from: response))
        return Swift.Result.failure(error)
    }
}
