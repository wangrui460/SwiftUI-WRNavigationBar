//
//  TitleView2.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct TitleSearchView: View {
    @State var searchText: String = ""
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .background(Color.blue)
        .isBackButtonBlack(false)
        .maxWidth(leading: 50, trailing: 50)
        .navigationBarTitleView(titleView: {
            TextField("WRNavigationBar", text: $searchText)
                .padding(.horizontal, 15)
                .frame(maxWidth: .infinity)
                .frame(height: 33)
                .background(Color.white)
                .clipShape(Capsule())
        })
    }
}

struct TitleSearchView_Previews: PreviewProvider {
    static var previews: some View {
        TitleSearchView()
    }
}
