
import UIKit

final class ViewController: UIViewController {

    private let label: UILabel = {
      let label = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 200, height: 70)
        label.textAlignment = .center
        label.text = "Log in"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    private let userName: UITextField = {
       let textField = UITextField()
        textField.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        textField.placeholder = "Username"
        textField.autocapitalizationType = .none
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.label.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        return textField
    }()
    private let password: UITextField = {
       let textField = UITextField()
        textField.frame = CGRect(x: 50, y: 250, width: 300, height: 30)
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.label.cgColor
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textField.leftViewMode = .always
        return textField
    }()
    private let button: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 100, y: 350, width: 200, height: 60)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 8
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(button)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    @objc func tapButton() {
        guard let userName = userName.text, let password = password.text, userName == "Oleg", password == "password" else {
            let alert = UIAlertController(title: "Invalid Login", message: "Try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
                            present (alert, animated: true)
                            return
        }
        let vc = AccountVC()
        vc.modalPresentationStyle = .fullScreen
                            present(vc, animated: true)
    }
}
final class AccountVC: UIViewController {
    private let label: UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.text = "Welcome, Pridurok"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32)
        label.frame = CGRect(x: 50, y: 300, width: 300, height: 70)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        view.addSubview(label)
    }
}
