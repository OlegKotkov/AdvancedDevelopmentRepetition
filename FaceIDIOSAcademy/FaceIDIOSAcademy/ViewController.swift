
import UIKit
import LocalAuthentication
class ViewController: UIViewController {
    private var buttonID: UIButton = {
       let button = UIButton()
        button.backgroundColor = .green
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Autorized", for: .normal)
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 100 , y: 250, width: 100, height: 40)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonID)
        buttonID.addTarget(self, action: #selector(tapID), for:  .touchUpInside)
    }
    @objc func tapID(){
        let context = LAContext()
        var error: NSError? = nil
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Пожадуйста авторизуйтесь"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                guard  success, error == nil else {
                    let alert = UIAlertController(title: "Не удалось пройти аунтефикацию", message: "Попробуйте еще", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
                    self?.present(alert,animated: true)
                    //failed
                    return
                }
                //Show other screen
                //Success
                    let vc = ViewController()
                    vc.title = "Welcome"
                    vc.view.backgroundColor = .systemBlue
                    self?.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
            }
            }
        }
        else {
            //can not use
            let alert = UIAlertController(title: "Не доступен", message: "Вы не можете использовать эту функцию", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dissmiss", style: .cancel, handler: nil))
            present(alert,animated: true)
        }
    }
}

