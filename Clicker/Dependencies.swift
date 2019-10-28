import Foundation
import UIKit

protocol DependenciesType {
    var application: UIApplication { get }
    var counterLogicController: CounterLogicControllerType { get }
    func buildCounterViewModel(for: CounterViewType?) -> CounterViewModelType
}

/*
 DEPENDENCIES
 ------------
 This is a super lightweight dependency management/injection pattern that remains useful
 out to surprisingly large scales.  The idea is that simply, a dependency collection
 (conforming to DependenciesType) can be used to manage shared dependencies,
 inject/instantiate objects cleanly from the middle levels of the dependency tree, etc.
 This pattern also lets us create just a couple dependency-collection mocks that can
 be used in tests of multiple classes.
 
 In a simple app like Clicker, the Dependencies object ends up being the backbone of the application,
 in the sense that it's holding references to the various plumbing classes like logic controllers, etc.
 In a more complex app with multiple userflows, we'd expect to see that responsibility shared with
 some kind of Router framework that manages the relationships between different views/flows/etc.
*/

class Dependencies: DependenciesType {
    public static let shared = Dependencies()
    
    var application: UIApplication {
        return UIApplication.shared
    }
    
    let counterLogicController: CounterLogicControllerType = CounterLogicController()
    
    func buildCounterViewModel(for view: CounterViewType?) -> CounterViewModelType {
        return CounterViewModel(view: view)
    }
}
