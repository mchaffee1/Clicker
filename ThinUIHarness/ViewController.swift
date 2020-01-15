import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func embedCounter() {
        guard let counterPageViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CounterPageViewController") as? CounterPageViewController else {
            fatalError("Could not instantiate counterPageViewController")
        }
        present(counterPageViewController, animated: false, completion: nil)
    }
}
