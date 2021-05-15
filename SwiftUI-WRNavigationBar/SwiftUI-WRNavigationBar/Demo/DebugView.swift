//
//  DebugView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct DebugView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .title("test")
        .maxWidth(leading: 120, trailing: 120)
        .background(Color.blue)
        .debug(true)
        .wrNavigationBarItems(trailing: {
            Text("🐦")
        })
    }
}

struct DebugView_Previews: PreviewProvider {
    static var previews: some View {
        DebugView()
    }
}
