import Foundation

@testable import Clicker

// Ideally the verification tooling would just be part of WiremockClient...
// There's already an open PR for that ()
// This simple playback tool is just a temporary fix until that PR is merged 😁
class WiremockVerify: CommunicatorType {
    func replayRequests() -> RequestPlayback? {
        var result: RequestPlayback?
        let semaphore = DispatchSemaphore(value: 0)
        get(path: "http://localhost:8080/__admin/requests") { (getResult: Result<RequestPlayback, Error>) in
            defer { semaphore.signal() }

            switch getResult {
            case .failure(let error):
                print(String(describing: error))
            case .success(let playback):
                result = playback
            }
        }
        _ = semaphore.wait(timeout: DispatchTime.now().advanced(by: DispatchTimeInterval.seconds(1)))
        return result
    }
}

struct RequestPlayback: Codable {
    let requests: [RecordedRequestAttributes]
}

struct RecordedRequestAttributes: Codable {
    let request: RecordedRequest
}

struct RecordedRequest: Codable {
    let url: String?
    let method: String?
    let body: String? // TODO replace with ValueType generic
}
