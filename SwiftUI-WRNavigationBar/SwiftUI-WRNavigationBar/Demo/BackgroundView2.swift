//
//  BackgroundView2.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct BackgroundView2: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .isBackButtonBlack(false)
        .title("Beauty")
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.red, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
        )
    }
}

struct BackgroundView2_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView2()
    }
}
