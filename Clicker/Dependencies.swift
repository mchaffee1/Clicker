import Foundation
import UIKit

protocol DependenciesType {
    var application: UIApplication { get }
    var counterLogicController: CounterLogicControllerType { get }
    func getCounterViewModel(for: CounterViewType?) -> CounterViewModelType
}

class Dependencies: DependenciesType {
    var application: UIApplication {
        return UIApplication.shared
    }
    
    public static let shared = Dependencies()
    
    let counterLogicController: CounterLogicControllerType = CounterLogicController()
    
    func getCounterViewModel(for view: CounterViewType?) -> CounterViewModelType {
        return CounterViewModel(view: nil)
    }
}
