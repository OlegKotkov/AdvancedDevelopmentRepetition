
import UIKit

class SecondViewController: UIViewController {
    
     private let alertButton: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 70, y: 500, width: 200, height: 50)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitle("Alert", for: .normal)
        return button
    }()
    private let buttonConverter: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 50, y: 600, width: 300, height: 50)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("КонвертацияВеличин", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let buttonConverterCustome: UIButton = {
       let button = UIButton()
        button.frame = CGRect(x: 50, y: 700, width: 300, height: 50)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.setTitle("КонвертацияКастомныхВеличин", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    private let textLabel: UILabel = {
       let label = UILabel()
        label.text = "ПримерЛокализацииСтрокИзАлерта"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .blue
        label.frame = CGRect(x: 0, y: 300, width: 400, height: 60)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Poshel sum tuda"
        //view.backgroundColor = .white
        view.addSubview(alertButton)
        view.addSubview(textLabel)
        view.addSubview(buttonConverter)
        view.addSubview(buttonConverterCustome)
        buttonConverter.addTarget(self, action: #selector(tapConverter), for: .touchUpInside)
       navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(presentVC))
        buttonConverterCustome.addTarget(self, action: #selector(tapCustomeValue), for: .touchUpInside)
        alertButton.addTarget(self, action: #selector(presentAlert), for: .touchUpInside)
    }
    @objc func tapCustomeValue() {
        let myUnit = UnitTemperature(symbol: "Popugay", converter: UnitConverterLinear(coefficient: 0.3))
        let measMyUnit = Measurement(value: 50, unit: myUnit)
        let convertedMyUnit = measMyUnit.converted(to: .kelvin)
        print(convertedMyUnit)
    }
    @objc func tapConverter () {
        let meas = Measurement(value: 1000, unit: UnitLength.inches)
        let converted = meas.converted(to: .kilometers)
        print(converted)
        let formatter = MeasurementFormatter()
        formatter.locale = Locale(identifier: "Ru")
        print(formatter.string(from: converted))
    }
    @objc func presentVC () {
        let vc = ViewController()
        let nvc = UINavigationController(rootViewController: vc)
        nvc.modalPresentationStyle = .fullScreen
        present(nvc, animated: true, completion: nil)
    }
    @objc func presentAlert () {
        let alert = UIAlertController(title: "fuck_You".localized, message: "go_there_yourself".localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "fuck_you_both".localized, style: .cancel))
        present(alert, animated: true)
    }
}
extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
