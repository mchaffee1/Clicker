import Foundation
import UIKit

protocol DependenciesType: CounterViewModelProviderType {
    var application: UIApplication { get }
    var counterLogicController: CounterLogicControllerType { get }
}
