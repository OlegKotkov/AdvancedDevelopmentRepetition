
import UIKit
import AVKit

class ViewController: UIViewController {

    private let button: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 50, y: 500, width: 200, height: 50)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("Camera", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let button1: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("ЛокализацияДаты", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let buttonAnyValue: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("МножественныеВеличины!!!!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let textLabel: UILabel = {
       let label = UILabel()
        label.text = "ПримерЛокализацииЗапросаВидеокамеры(смотри настройки и InfoPlist.String)"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .blue
        label.frame = CGRect(x: 0, y: 300, width: 400, height: 60)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white
        title = "Poshel na Huy!"
        view.addSubview(textLabel)
        view.addSubview(button)
        view.addSubview(button1)
        view.addSubview(buttonAnyValue)
        button.addTarget(self, action: #selector(didTapped), for: .touchUpInside)
        button1.addTarget(self, action: #selector(tapButtonDate), for: .touchUpInside)
        /*
        buttonAnyValue.addTarget(self, action: #selector(anyValueTap), for: .touchUpInside)
         */
      navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(presenSecondController))
    }
    /*
    @objc func anyValueTap() {
        let localized = NSLocalizedString("any_laikov", comment: "")
        let formatted = String(format: localized, numberOfChairs)
        print(formatted)
    }
    */
    
   @objc func presenSecondController () {
       let sVc = SecondViewController()
        let nVc2 = UINavigationController(rootViewController: sVc)
       nVc2.modalPresentationStyle = .fullScreen
       self.present(nVc2, animated: true, completion: nil)
   }
    @objc func tapButtonDate() {
       let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .full
        print("Нелокализованная дата: \(formatter.string(from: date))")
        formatter.locale = Locale(identifier: "En")
        print("Дата в En локали: \(formatter.string(from: date))")
    }
    @objc func didTapped(){
        AVCaptureDevice.requestAccess(for: .video) { responce in
            if responce {
                print("Доступ получен")
            } else {
                print("Доступ запрещен")
            }
        }
    }
}


