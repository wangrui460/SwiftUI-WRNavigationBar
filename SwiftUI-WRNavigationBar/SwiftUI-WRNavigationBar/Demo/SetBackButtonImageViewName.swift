//
//  SetBackButtonImageView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct SetBackButtonImageViewName: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .title("test")
        .backButtonImageName("cus_back")
    }
}

struct SetBackButtonImageViewName_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
