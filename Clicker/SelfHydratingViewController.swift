import Foundation
import UIKit

public protocol SelfHydratingViewController: UIViewController {
    static func hydrate() -> Self?
}
