
import UIKit

class ThirdViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()

    }
// Варианты установки картинки в закисимости от установленой темы
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            //imageView = self.downloaderImage1
        }else{
            //imageView = self.downloaderImage2
        }
    }
}
