
import UIKit

class FourthViewController: UIViewController {
    
    private let textViev: UITextView = {
       let view = UITextView()
        view.frame = CGRect(x: 5, y: 30, width: 400, height: 350)
        view.backgroundColor = .cyan
        return view
    }()
    private let label: UILabel = {
       let label = UILabel()
        label.text = "Кастомные темы"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .green
        label.frame = CGRect(x: 30, y: 500, width: 350, height: 30)
        return label
    }()
    private let buttonChangeTheme: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitle("ChangeThemeCustome", for: .normal)
        button.frame = CGRect(x: 30, y: 450, width: 350, height: 50)
        button.layer.cornerRadius = 10
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(label)
        view.addSubview(textViev)
        view.addSubview(buttonChangeTheme)
        buttonChangeTheme.addTarget(self, action: #selector(tapTheme), for: .touchUpInside)
    }
    @objc func tapTheme() {
        if Theme.current.type == .dark {
            Theme.current = .light
        }else {
            Theme.current = .dark
        }
    }
}
extension UILabel: Themable {
    func apply(theme: Theme) {
        textColor = theme.color.main
    }
}
extension UIButton : Themable {
    func apply(theme: Theme) {
        backgroundColor = theme.color.backgroung
    }
}
extension  UITextView : Themable {
    func apply(theme: Theme) {
        backgroundColor = theme.color.backgroung
    }
}

