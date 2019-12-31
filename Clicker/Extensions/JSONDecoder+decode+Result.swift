import Foundation

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
