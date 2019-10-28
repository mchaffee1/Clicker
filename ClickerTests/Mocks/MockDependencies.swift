import Foundation
import UIKit

@testable import Clicker

class MockDependencies: DependenciesType {
    var application: UIApplication {
        return UIApplication.shared
    }
    
    var counterLogicController: CounterLogicControllerType = MockCounterLogicController()
    var mockCounterLogicController: MockCounterLogicController? {
        return self.counterLogicController as? MockCounterLogicController
    }

    var mockCounterViewModel = MockCounterViewModel()
    var getCounterViewModelCalls = [CounterViewType?]()
    func buildCounterViewModel(for view: CounterViewType?) -> CounterViewModelType {
        getCounterViewModelCalls.append(view)
        return mockCounterViewModel
    }
}
