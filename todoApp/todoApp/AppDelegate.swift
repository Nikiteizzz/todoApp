//
//  AppDelegate.swift
//  todoApp
//
//  Created by Никита Хорошко on 16.09.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationController = UINavigationController(rootViewController: MainViewController())
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(sender:))))
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        return true
    }

    @objc func dismissKeyboard(sender: UITapGestureRecognizer) {
        window?.endEditing(true)
    }
}

extension UIColor {
    class var oppositeToSystemColor: UIColor {
    let color = UIColor() { traitCollection -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified: return UIColor.black
        default: return UIColor.white
        }
    }
    return color
    }
    
    class var oppositeToSystemColorGray: UIColor {
    let color = UIColor() { traitCollection -> UIColor in
        switch traitCollection.userInterfaceStyle {
        case .light, .unspecified: return UIColor.systemGray5
        default: return UIColor.darkGray
        }
    }
    return color
    }
    
    class func rgbColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1.0)
    }
}
