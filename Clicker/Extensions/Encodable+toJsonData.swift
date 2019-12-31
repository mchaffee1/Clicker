import Foundation

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
