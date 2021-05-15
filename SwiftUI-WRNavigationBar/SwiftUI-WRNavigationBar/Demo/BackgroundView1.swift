//
//  BackgroundView1.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct BackgroundView1: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .isBackButtonBlack(false)
        .background(
            Image("sky")
        )
    }
}

struct BackgroundView1_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView1()
    }
}
