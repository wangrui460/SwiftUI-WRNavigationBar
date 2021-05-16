//
//  WRHelper.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/5/8.
//

import UIKit

typealias WRBlock = () -> Void

enum WRHelper {
    static let height: CGFloat = UIScreen.main.bounds.size.height

    /// Portrait
    enum UnsafeArea {
        /// 顶部非安全区域高度(== 状态栏高度)
        static var top: CGFloat {
            UIWindow.keyWindow?.safeAreaInsets.top ?? 0
        }
    }

    enum StatusBar {
        static var frame: CGRect {
            UIWindow.keyWindow?.windowScene?.statusBarManager?.statusBarFrame ?? .zero
        }
        static let height: CGFloat = frame.size.height
    }

    enum NavigationBar {
        static let height: CGFloat = 44
        static let bottom: CGFloat = height + StatusBar.height
    }

    static var iphoneXSeries: Bool {
        if UIDevice.current.userInterfaceIdiom != UIUserInterfaceIdiom.phone {
            debugPrint("not iPhone - \(UIDevice.current.userInterfaceIdiom.rawValue)")
        }
        if #available(iOS 11.0, *) {
            if let bottom = UIWindow.keyWindow?.safeAreaInsets.bottom, bottom > 0 {
                return true
            }
        } else {
            debugPrint("iOS11 previews")
        }
        return false
    }
}

extension UIWindow {
    static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
