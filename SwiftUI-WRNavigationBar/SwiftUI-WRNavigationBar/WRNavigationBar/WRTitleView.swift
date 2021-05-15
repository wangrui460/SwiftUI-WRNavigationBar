//
//  WRTitleView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/5/15.
//

import SwiftUI

/// navigationBar title view
struct WRTitleView: View {

    var content: AnyView?

    var body: some View {
        if content != nil {
            content
        } else {
            Color.clear
        }
    }
}
