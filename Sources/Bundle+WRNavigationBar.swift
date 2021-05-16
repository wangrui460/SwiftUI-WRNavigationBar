//
//  Bundle+WRNavigationBar.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import Foundation

extension Bundle {

    private static var bundle: Bundle? = nil

    static var normal_module: Bundle? = {
        let bundleName = "WRNavigationBar"

        var candidates = [
            // Bundle should be present here when the package is linked into an App.
            Bundle.main.resourceURL,

            // Bundle should be present here when the package is linked into a framework.
//            Bundle(for: ZLPhotoPreviewSheet.self).resourceURL,

            // For command-line tools.
            Bundle.main.bundleURL,
        ]

//        #if SWIFT_PACKAGE
//        // For SWIFT_PACKAGE.
//        candidates.append(Bundle.module.bundleURL)
//        #endif

        for candidate in candidates {
            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
                return bundle
            }
        }

        return nil
    }()

//    static var spm_module: Bundle? = {
//        let bundleName = "ZLPhotoBrowser_ZLPhotoBrowser"
//
//        let candidates = [
//            // Bundle should be present here when the package is linked into an App.
//            Bundle.main.resourceURL,
//
//            // Bundle should be present here when the package is linked into a framework.
//            Bundle(for: BundleFinder.self).resourceURL,
//
//            // For command-line tools.
//            Bundle.main.bundleURL,
//        ]
//
//        for candidate in candidates {
//            let bundlePath = candidate?.appendingPathComponent(bundleName + ".bundle")
//            if let bundle = bundlePath.flatMap(Bundle.init(url:)) {
//                return bundle
//            }
//        }
//
//        return nil
//    }()

    static var wrNavigationBarBundle: Bundle? {
        return normal_module
    }
}
