import Foundation
import UIKit

protocol DependenciesType {
    var application: UIApplication { get }
    var counterLogicController: CounterLogicControllerType { get }
    func buildCounterViewModel(for: CounterViewType?) -> CounterViewModelType
}

class Dependencies: DependenciesType {
    var application: UIApplication {
        return UIApplication.shared
    }
    
    public static let shared = Dependencies()
    
    let counterLogicController: CounterLogicControllerType = CounterLogicController()
    
    func buildCounterViewModel(for view: CounterViewType?) -> CounterViewModelType {
        return CounterViewModel(view: view)
    }
}
