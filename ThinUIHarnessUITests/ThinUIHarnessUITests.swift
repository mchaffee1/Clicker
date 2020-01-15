import XCTest
@testable import ThinUIHarness

class ThinUIHarnessUITests: XCTestCase {
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        tapCoordinate(in: app, at: 100.0, and: 200.0)
        XCUIApplication().staticTexts["43"].tap()
        XCUIApplication().staticTexts["44"].tap()

        XCTAssertTrue(XCUIApplication().staticTexts["45"].exists)
    }

    func tapCoordinate(in app: XCUIApplication, at xCoordinate: Double, and yCoordinate: Double) {
        let normalized = app.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
}
