//
//  BackButtonTapActionView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/15.
//

import SwiftUI

struct BackButtonTapActionView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var show = false
    var body: some View {
        WRNavigationBar {
            ListView()
                .alert(isPresented: $show, content: {
                    Alert(title: Text("提醒"),
                          message: Text("确认要返回吗？"),
                          primaryButton: Alert.Button.cancel(Text("取消")),
                          secondaryButton: Alert.Button.destructive(Text("确认"), action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }))
                })
        }
        .title("setBackBtnTapAction")
        .hiddenLine(false)
        .backButtonTapAction {
            self.show.toggle()
        }
    }
}

struct BackButtonTapActionView_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonTapActionView()
    }
}
