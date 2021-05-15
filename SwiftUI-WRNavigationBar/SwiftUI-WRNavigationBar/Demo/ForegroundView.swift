//
//  ForegroundView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/15.
//

import SwiftUI

struct ForegroundView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .title("set foreground")
        .foreground(.white)
        .isBackButtonBlack(false)
        .background(Color.blue)
    }
}

struct ForegroundView_Previews: PreviewProvider {
    static var previews: some View {
        ForegroundView()
    }
}
