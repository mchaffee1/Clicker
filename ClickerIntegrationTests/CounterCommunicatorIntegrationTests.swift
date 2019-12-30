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
        stubCountResponse(withCount: randomInt)
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

    func stubCountResponse(withCount count: Int) {
        let stubMapping = StubMapping.stubFor(
            requestMethod: .GET,
            urlMatchCondition: .urlEqualTo,
            url: "/counter")
            .willReturn(ResponseDefinition()
                .withStatus(200)
                .withBody(["count": count])
        )
        WiremockClient.postMapping(stubMapping: stubMapping)
    }
}