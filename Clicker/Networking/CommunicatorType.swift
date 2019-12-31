import Foundation

protocol CommunicatorType {
}

extension CommunicatorType {
    typealias ResultHandler<T> = (Result<T, Error>) -> ()

    func post<ValueType: Encodable>(path: String, value: ValueType, completionHandler: @escaping ResultHandler<Any> = { _ in }) {
        guard let url = URL(string: path),
            let jsonData = value.toJsonData() else {
                completionHandler(Result.failure("Unable to encode url and/or post body"))
            return
        }
        let request: URLRequest = {
            var result = URLRequest(url: url)
            result.httpMethod = "POST"
            return result
        }()
        URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
            if let error = error {
                completionHandler(Result.failure(error))
            } else {
                completionHandler(Result.success("POST succeeded"))
            }
        }.resume()
    }

    func get<ResultType: Decodable>(path: String, completionHandler: @escaping ResultHandler<ResultType>) {
        guard let url = URL(string: path) else {
            completionHandler(Result.failure("Could not instantiate url from \(path)"))
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completionHandler(Result.failure(error))
            } else {
                completionHandler(ResultType.from(json: data))
            }
        }.resume()
    }
}
