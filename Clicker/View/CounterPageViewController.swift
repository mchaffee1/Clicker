import Foundation
import UIKit

class CounterPageViewController: UIViewController, CounterViewType {
    var dependencies: DependenciesType = Dependencies.shared
    // TODO replace with delegate/datasource situation
    private var viewModel: CounterViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = dependencies.getCounterViewModel(for: self)
        showData(from: viewModel)
        self.viewModel = viewModel
    }

    @IBOutlet weak var countLabel: UILabelType?

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        tap()
    }

    private func tap() {
        viewModel?.tap()
    }

    func showData(from viewModel: CounterViewModelType) {
        countLabel?.text = viewModel.countText
    }
}
