//
//  WRDefaultTitleView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/5/14.
//

import SwiftUI

struct WRDefaultTitleView: View {
    let title: String
    let foreground: Color
    var body: some View {
        Text(title)
            .lineLimit(1)
            .foregroundColor(foreground)
            .font(.system(size: 17))
    }
}

struct WRDefaultTitleView_Previews: PreviewProvider {
    static var previews: some View {
        WRDefaultTitleView(title: "test", foreground: .black)
    }
}
