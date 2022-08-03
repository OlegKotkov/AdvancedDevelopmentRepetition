
import Foundation
import UIKit

struct Theme {
    enum ThemeType {
        case light
        case dark
        @available(iOS 13.0 , *)
        case adaptive
    }
    static let light = Theme(type: ThemeType.light, color: ColorPalette.light)
    @available (iOS 13.0 , *)
    static let  dark = Theme(type: ThemeType.dark, color: ColorPalette.dark)
    static let adaptive = Theme(type: ThemeType.adaptive, color: ColorPalette.adaptive)
    
    static var current: Theme = {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            return dark
        }else {
            return light
        }
    }() {
        didSet {
            guard let scene = UIApplication.shared.connectedScenes.first
            else {return}
            guard let mainWindow = (scene as? UIWindowScene)?.keyWindow
            else {return}
            
            func checkSubViews(_ subview: UIView){
                if let themable = subview as? Themable {
                    themable.apply(theme: current)
                }
                subview.subviews.forEach { sub  in
                    checkSubViews(sub)
                }
            }
            checkSubViews(mainWindow)
        }
    }
    let type: ThemeType
    let color: ColorPalette
}
struct ColorPalette {
    let main: UIColor
    let tint: UIColor
    let backgroung: UIColor
    
    static let light = ColorPalette (main: .white, tint: .red, backgroung: .gray)
    
    static let dark = ColorPalette (main: .gray, tint: .yellow, backgroung: .black)
    
    static let adaptive = ColorPalette (main: UIColor(named: "themeMainColor") ?? UIColor(),
                                      tint: UIColor(named: "themeTintColor") ?? UIColor(),
                                      backgroung: UIColor(named: "themeBackgroundColor") ?? UIColor())
}
// Протокол для адаптации всех View компонентов

protocol Themable {
    func apply (theme: Theme)
}
