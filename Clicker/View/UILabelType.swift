import Foundation
import UIKit

// Here we're creating a mockable protocol out of UILabel.  In this application, we're only interacting with the text
// property, so that's the only member we've rolled into the protocol.  In apps with more elaborate UI, these wrapper protocols
// (and associated mocks) get bigger.
@objc protocol UILabelType: class {
    var text: String? { get set }
}

extension UILabel: UILabelType {}
