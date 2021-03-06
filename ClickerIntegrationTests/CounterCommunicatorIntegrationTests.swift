import XCTest
import WiremockClient

@testable import Clicker

class CounterCommunicatorIntegrationTests: XCTestCase {
    var counterCommunicator: CounterCommunicator!

    override func setUp() {
        guard WiremockClient.isServerRunning() else {
            fatalError("Wiremock server is not running")
        }
        counterCommunicator = CounterCommunicator()
    }

    override func tearDown() {
        WiremockClient.reset()
    }

    func testShouldFetchCounterFromEndpoint() {
        let randomInt = Int.random(in: Int.min...Int.max)
        WiremockClient.stubCountGetResponse(withCount: randomInt)
        let expectation = XCTestExpectation(description: "waiting for return from get")

        counterCommunicator.loadCount { result in
            switch result {
            case .success(let value):
                XCTAssertEqual(value, randomInt)
            case .failure(let error):
                XCTFail(String(describing: error))
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func testShouldPostCounterToEndpoint() {
        let randomInt = Int.random(in: Int.min...Int.max)
        WiremockClient.stubCountPostResponse()

        let expectation = XCTestExpectation(description: "waiting for return from post")
        counterCommunicator.save(count: randomInt) { _ in
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 0.5)

        let postRequests = WiremockVerify().replayPosts(to: "/counter")
        let mostRecentPostedCount = try? Count.from(string: postRequests.first?.body).get()

        XCTAssertEqual(postRequests.count, 1)
        XCTAssertEqual(mostRecentPostedCount?.count, randomInt)
    }
}
