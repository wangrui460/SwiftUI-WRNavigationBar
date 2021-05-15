//
//  IgnoreTopAreaView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/15.
//

import SwiftUI

struct IgnoreTopAreaView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .isBackButtonBlack(false)
        .ignoringTopArea(true)
    }
}

struct ListView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(0 ..< 100) { item in
                    Text("SwiftUI-WRNavigationBar \(item)")
                        .foregroundColor(.white)
                        .frame(maxWidth: UIScreen.main.bounds.width)
                        .frame(height: 60)
                }
                .background(Color.gray)
            }
        }
    }
}

struct IgnoreTopAreaView_Previews: PreviewProvider {
    static var previews: some View {
        IgnoreTopAreaView()
    }
}
