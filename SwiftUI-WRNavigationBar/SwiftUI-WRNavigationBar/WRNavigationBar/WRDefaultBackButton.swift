//
//  WRDefaultBackButton.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/4/14.
//

import SwiftUI

// add @Environment(\.presentationMode) var presentationMode 
struct WRDefaultBackButton: View {

    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var isBlack: Bool = true
    var foreground: Color = .black
    var action: WRBlock?
    init(tapAction: WRBlock? = nil, isBlack: Bool = true, foreground: Color = .black) {
        self.action = tapAction
        self.isBlack = isBlack
        self.foreground = foreground
    }
    var body: some View {
        Button(action: {
            if let action = action {
                action()
            } else {
                self.presentationMode.wrappedValue.dismiss()
            }
        }) {
            Image(isBlack ? "back_arrow" : "back_arrow_white")
                .resizable()
                .frame(width: 13, height: 13)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foreground)
        }
    }
}

struct WRDefaultBackButton_Previews: PreviewProvider {
    static var previews: some View {
        WRDefaultBackButton(isBlack: true)
    }
}
