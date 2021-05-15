//
//  LeadingAndTrailingView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/15.
//

import SwiftUI

struct LeadingAndTrailingView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .title("leading & trailing")
        .foreground(.white)
        .isBackButtonBlack(false)
        .background(Color.blue)
        .wrNavigationBarItems(leading: {
            Image(systemName: "xmark")
                .padding(.leading, 10)
        }, trailing: {
            Image(systemName: "paperplane.fill")
        })
    }
}

struct LeadingAndTrailingView_Previews: PreviewProvider {
    static var previews: some View {
        LeadingAndTrailingView()
    }
}
