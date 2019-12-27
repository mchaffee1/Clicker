import Foundation
import Alamofire

protocol CounterCommunicatorType {
    func get(completionHandler: @escaping (Swift.Result<Int, Error>)->())
}

class CounterCommunicator: CounterCommunicatorType {
    func get(completionHandler: @escaping (Swift.Result<Int, Error>) -> ()) {
        Alamofire.request("http://localhost:8080/counter", method: .get)
            .responseJSON { dataResult in
                guard dataResult.result.isSuccess else {
                    let defaultError: NSError = NSError(domain: "Could not get result code", code: -1, userInfo: nil)
                    let error = dataResult.result.error ?? defaultError
                    completionHandler(Swift.Result.failure(error))
                    return
                }
                guard let resultDict = dataResult.result.value as? [String: Any],
                    let result = resultDict["count"] as? Int else {
                        completionHandler(Swift.Result.failure(NSError(domain: "Could not deserialize json", code: -1, userInfo: nil)))
                    return
                }
                completionHandler(Swift.Result.success(result))
        }
    }
}
