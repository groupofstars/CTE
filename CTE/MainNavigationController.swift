import UIKit
class MainNavigationController: UINavigationController {
   override func viewDidLoad() {
       super.viewDidLoad()
       navigationBar.tintColor = .white
       navigationBar.barTintColor = .blue
       navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let rootViewController = ViewController()
       pushViewController(rootViewController, animated: false)
   }
}
