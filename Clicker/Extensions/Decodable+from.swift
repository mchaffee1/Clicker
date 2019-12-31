import Foundation

extension Decodable {
    static func from(json: Data?) -> Result<Self, Error> {
        return JSONDecoder().decode(Self.self, from: json)
    }

    static func from(string: String?) -> Result<Self, Error> {
        guard let data = string?.data(using: .utf8) else {
            return Result.failure("Unable to convert \(String(describing: string)) to data")
        }
        return Self.from(json: data)
    }
}
