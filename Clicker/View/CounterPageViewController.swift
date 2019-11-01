import Foundation
import UIKit

class CounterPageViewController: UIViewController, CounterViewType {
    var dependencies: DependenciesType = Dependencies.shared
    private var viewModel: CounterViewModelType?

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = dependencies.buildCounterViewModel(for: self)
        showData(from: viewModel)
        self.viewModel = viewModel
    }

    // Note that we've defined this label as a protocol of our own creation.  This isn't always necessary
    // but I did want to demo this pattern.  Check out CounterPageViewControllerTests to see how this lets us
    // test interactions between a ViewController and its UI elements quickly and cleanly.
    @IBOutlet weak var countLabel: UILabelType?

    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        tap()
    }

    private func tap() {
        viewModel?.tap()
    }

    @IBAction func swipeDown(_ sender: UISwipeGestureRecognizer) {
        swipeDown()
    }
    
    private func swipeDown() {
        viewModel?.swipeDown()
    }
    
    func showData(from viewModel: CounterViewModelType) {
        countLabel?.text = viewModel.countText
    }
}
