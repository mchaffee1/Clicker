import Foundation
import UIKit

class CounterPageViewController: UIViewController, CounterViewType {
    let dependencies: DependenciesType = Dependencies.shared
    // TODO replace with delegate/datasource situation
    private var viewModel: CounterViewModelType?

    override func viewDidLoad() {
        guard self.viewModel == nil else {
            return
        }
        self.viewModel = CounterViewModel(view: self, logicController: dependencies.counterLogicController)
    }

    @IBOutlet weak var countLabel: UILabel?

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        tap()
    }

    private func tap() {

    }

    func showData(from viewModel: CounterViewModelType) {
        countLabel?.text = viewModel.countText
    }
}
