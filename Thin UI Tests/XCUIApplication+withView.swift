import XCTest

@testable import Clicker

extension XCUIApplication {
    func withView(ofClass className: String) -> Self {
        launchArguments.append(contentsOf: ["-view", className])
        return self
    }
}
