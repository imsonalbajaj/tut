//
//  Helper.swift
//  tut
//
//  Created by Sonal on 29/04/25.
//

import SwiftUI


extension UIApplication {
    static func topViewController(
        _ controller: UIViewController? = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first?.rootViewController
    ) -> UIViewController? {
        if let nav = controller as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = controller as? UITabBarController {
            return tab.selectedViewController.flatMap { topViewController($0) }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(presented)
        }
        return controller
    }
}
