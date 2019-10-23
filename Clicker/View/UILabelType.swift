import Foundation
import UIKit

@objc protocol UILabelType: class {
    var text: String? { get set }
}

extension UILabel: UILabelType {}
