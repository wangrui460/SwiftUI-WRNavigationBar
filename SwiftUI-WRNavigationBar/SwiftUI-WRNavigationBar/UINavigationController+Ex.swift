//
//  UINavigationController.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/4/21.
//

import SwiftUI

// https://stackoverflow.com/questions/59234958/swiftui-navigationbarbackbuttonhidden-swipe-back-gesture
extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
