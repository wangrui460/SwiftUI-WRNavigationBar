//
//  HiddenBottomLine.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/15.
//

import SwiftUI

struct HiddenBottomLineView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .title("hidden bottoom line")
        .hiddenLine(true)
    }
}

struct HiddenBottomLineView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenBottomLineView()
    }
}
