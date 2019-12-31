import Foundation

extension Decodable {
    static func from(json: Data?) -> Result<Self, Error> {
        return JSONDecoder().decode(Self.self, from: json)
    }
}
