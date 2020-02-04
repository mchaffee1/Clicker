import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        guard let counterPageViewController: CounterPageViewController = CounterPageViewController.hydrate() else {
            fatalError("could not instantiate counterPageViewController")
        }
        window?.rootViewController = counterPageViewController
        window?.makeKeyAndVisible()
        return true
    }
}
