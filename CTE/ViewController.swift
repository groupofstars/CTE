
import UIKit
 class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .white
         let button = UIButton(type: .system)
        button.setTitle("Go to Detail", for: .normal)
        button.addTarget(self, action: #selector(goToDetail), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(button)
         NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
     @objc func goToDetail() {
        let detailViewController = DetailViewController()
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
 
 
