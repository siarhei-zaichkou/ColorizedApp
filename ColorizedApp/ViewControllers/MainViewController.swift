import UIKit

protocol SettingViewControllerDelegate {
    func setBackground(color: UIColor?)
}

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingViewController else { return }
        settingsVC.viewColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

// MARK: - SettingViewControllerDelegate
extension MainViewController: SettingViewControllerDelegate {
    func setBackground(color: UIColor?) {
        view.backgroundColor = color
    }
}
