import XCTest

@testable import Clicker

extension XCUIApplication {
    func withView(ofClass className: String) -> Self {
        launchArguments = ["-view", className]
        return self
    }
}
