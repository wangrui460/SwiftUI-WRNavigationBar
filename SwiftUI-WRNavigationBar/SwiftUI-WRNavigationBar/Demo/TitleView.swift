//
//  TitleView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .background(Color.blue)
        .isBackButtonBlack(false)
        .navigationBarTitleView(titleView: {
            VStack {
                Text("title")
                    .font(.subheadline)
                Text("the desc")
                    .font(.system(size: 10))
            }
            .foregroundColor(.white)
        })
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
