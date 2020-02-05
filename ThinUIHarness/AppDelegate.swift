import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)

        guard let namespace = Bundle.main.infoDictionary?["CFBundleExecutable"] as? String else {
            fatalError("Could not get namespace")
        }
        guard let classParam = UserDefaults.standard.string(forKey: "view") else {
                fatalError("Could not get initial view class - make sure -view param is passed")
        }

        let className = "\(namespace).\(classParam)"

        guard let classIdentity = NSClassFromString(className).self as? SelfHydratingViewController.Type else {
            fatalError("Could not get class identity for '\(className)'")
        }
        present(viewControllerOfType: classIdentity)
        return true
    }

    func present(viewControllerOfType T: SelfHydratingViewController.Type ) {
        guard let viewController = T.hydrate() else { fatalError("Could not instantiate view controller of type \(T)")}
        present(viewController: viewController)
    }

    func present(viewController: UIViewController) {
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

