import Foundation
import UIKit

class CounterPageViewController: UIViewController, CounterViewType {
    let dependencies: DependenciesType = Dependencies.shared
    private var viewModel: CounterViewModel?

    override func viewDidLoad() {
        self.viewModel = CounterViewModel(view: self, logicController: dependencies.counterLogicController)
    }

    @IBOutlet weak var countLabel: UILabel?

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        tap()
    }

    private func tap() {
        countLabel?.text = "Tapped!"
    }

    func showData(from viewModel: CounterViewModelType) {
        countLabel?.text = viewModel.countText
    }
}
