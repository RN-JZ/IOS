import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create an instance of the FlowLifeCycleViewController
        let flowLifeCycleViewController = FlowLifeCycleViewController()

        // Create a navigation controller and set the flowLifeCycleViewController as its root view controller
        let navigationController = UINavigationController(rootViewController: flowLifeCycleViewController)

        // Create the window and set the navigation controller as the root view controller
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()

        return true
    }

}

