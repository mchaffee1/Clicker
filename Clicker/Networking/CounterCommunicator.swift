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
        post(path: counterPath, value: Count(count: count)) { _ in }
    }
}

protocol CommunicatorType {
}

extension CommunicatorType {
    typealias ResultHandler<T> = (Result<T, Error>) -> ()

    // TODO add error handling
    func post<ValueType: Encodable>(path: String, value: ValueType, completionHandler: @escaping ((Result<Any, Error>) -> ()) = { _ in }) {
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

extension Decodable {
    static func from(json: Data?) -> Result<Self, Error> {
        return JSONDecoder().decode(Self.self, from: json)
    }
}

extension JSONDecoder {
    func decode<T>(_ type: T.Type, from data: Data?) -> Result<T, Error> where T : Decodable {
        return Result() {
            guard let data = data else {
                let context = DecodingError.Context(codingPath: [], debugDescription: "Could not decode nil json data")
                throw DecodingError.valueNotFound(String.self, context)
            }
            return try decode(type, from: data)
        }
    }
}

extension Encodable {
    func toJsonData() -> Data? {
        do {
            return try JSONEncoder().encode(self)
        } catch {
            print(error)
            return nil
        }
    }
}

extension String: Error {
}
