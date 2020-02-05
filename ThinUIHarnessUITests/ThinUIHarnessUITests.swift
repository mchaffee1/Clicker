import XCTest
@testable import ThinUIHarness

class ThinUIHarnessUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // TODO pass class identity instead of string
        app = XCUIApplication().withView(ofClass: "CounterPageViewController")
        app.launch()

        continueAfterFailure = false
    }

    func testExample() {
        // UI tests must launch the application that they test.

        tapCoordinate(in: app, atX: 100.0, andY: 200.0)
        app.staticTexts["43"].tap()
        app.staticTexts["44"].tap()

        XCTAssertTrue(app.staticTexts["45"].exists)
    }

    func tapCoordinate(in element: XCUIElement, atX xCoordinate: Double, andY yCoordinate: Double) {
        let normalized = element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: xCoordinate, dy: yCoordinate))
        coordinate.tap()
    }
}
