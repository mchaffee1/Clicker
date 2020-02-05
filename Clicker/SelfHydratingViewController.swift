import Foundation
import UIKit

// TODO move to Thin UI Test Harness
public protocol SelfHydratingViewController: UIViewController {
    static func hydrate() -> Self?
}

public extension SelfHydratingViewController {
    static func hydrate() -> Self? {
        return Self(nibName: String(describing: Self.self), bundle: nil)
    }
}
