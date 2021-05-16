//
//  Bundle+WRNavigationBar.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/5/16.
//

import Foundation

extension Bundle {

    private static var bundle: Bundle? = nil

    static var normal_module: Bundle? = {
        let bundleName = "WRNavigationBar"

        var candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        return nil
    }()

    static var wrNavigationBarBundle: Bundle? {
        return normal_module
    }
}
