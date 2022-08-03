
import UIKit

class ViewController: UIViewController {
    
    private let buttonToFourController: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("FourthController", for: .normal)
        button.frame = CGRect(x: 30, y: 200, width: 300, height: 20)
        button.layer.cornerRadius = 10
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(buttonToFourController)
        buttonToFourController.addTarget(self, action: #selector(tapButtonToFourthController), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapLeftItem))
            view.backgroundColor = UIColor.appTintColor
    }
    @objc func tapItem() {
      let sVc = SecondViewController()
        sVc.modalPresentationStyle = .fullScreen
        self.present(sVc,animated: true, completion: nil)
    }
    @objc func tapLeftItem() {
        let tVc = ThirdViewController()
        tVc.modalPresentationStyle = .fullScreen
        self.present(tVc, animated: true, completion: nil)
    }
    @objc func tapButtonToFourthController(){
        let fVc = FourthViewController()
        fVc.modalPresentationStyle = .fullScreen
        self.present(fVc,animated: true, completion: nil)
    }
    
}
extension UIColor {
    static let appTintColor: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return UIColor(red: 1.0, green: 0, blue: 0.0, alpha: 1.0)
                    //Темный цвет из палитры
                } else {
                    return UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
                    //Светлый цвет из палитры
                }
            }
        }else {
            return UIColor.systemBlue//По умолчанию
        }
    }()
}
