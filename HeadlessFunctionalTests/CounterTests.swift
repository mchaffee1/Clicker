import Foundation
import XCTest
import WiremockClient

@testable import Clicker

/*
 So here's a very simple headless functional test.  What we do is stand up the whole application
 (using a real Dependencies instance) and then use a mock view to interact with a real view model.
 If we were testing a userflow that included an API call, then we'd also want to mock that API
 (using an external tool like Mountebank) and configure the headless app to call the mock instead of the real API
 (ideally that would be a config, rather than a code, difference).
 */

class CounterTests: XCTestCase {
    var dependencies: DependenciesType!
    
    var mockCounterView: MockCounterView!
    
    var counterViewModel: CounterViewModelType!

    var randomApiCount: Int!
    
    override func setUp() {
        guard WiremockClient.isServerRunning() else {
            fatalError("Wiremock server is not running")
        }
        randomApiCount = Int.random(in: Int.min...Int.max)
        WiremockClient.stubCountGetResponse(withCount: randomApiCount)
        WiremockClient.stubCountPostResponse()

        dependencies = Dependencies()
        mockCounterView = MockCounterView()
        
        counterViewModel = dependencies.buildCounterViewModel(for: mockCounterView)
    }

    override func tearDown() {
        WiremockClient.reset()
    }
    
    func testShouldIncrementCountOnTap() {
        Thread.sleep(forTimeInterval: 0.1)  // TODO wait more elegantly
        XCTAssertEqual(counterViewModel.countText, String(randomApiCount), "The app should launch showing the API count")

        counterViewModel.tap()
        Thread.sleep(forTimeInterval: 0.1)  // TODO wait more elegantly

        XCTAssertEqual(mockCounterView.showDataCallCount, 1, "After one tap, the view should have been evented once")
        XCTAssertEqual(counterViewModel.countText, String(1 + randomApiCount), "After one tap, the app should show a count incremented once")
        XCTAssertEqual(mostRecentPostedCount(), 1 + randomApiCount, "After one tap, the app should post a count incremented once")

        counterViewModel.tap()
        Thread.sleep(forTimeInterval: 0.1)  // TODO wait more elegantly

        XCTAssertEqual(mockCounterView.showDataCallCount, 2, "After a second tap, the view should have been evented twice")
        XCTAssertEqual(counterViewModel.countText, String(2 + randomApiCount), "After a second tap, the view should show a count of two")
        XCTAssertEqual(mostRecentPostedCount(), 2 + randomApiCount, "After a second tap, the app should post a count incremented twice")
    }

    func mostRecentPostedCount() -> Int? {
        return try? Count.from(string: WiremockVerify().replayPosts(to: "/counter").first?.body).get().count
    }
}
