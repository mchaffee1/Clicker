import Foundation
import UIKit

public protocol SelfHydratingViewController: UIViewController {
    static func hydrate() -> Self?
}

public extension SelfHydratingViewController {
    static func hydrate() -> Self? {
        return Self(nibName: String(describing: Self.self), bundle: nil)
    }
}
