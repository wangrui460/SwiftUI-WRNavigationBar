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
    var named: String?
    var isBlack: Bool = true
    var foreground: Color = .black
    var action: WRBlock?

    init(named: String? = nil, tapAction: WRBlock? = nil, isBlack: Bool = true, foreground: Color = .black) {
        self.named = named
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
            backImage()
                .resizable()
                .frame(width: 13, height: 13)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(foreground)
        }
    }

    private func backImage() -> Image {
        if named != nil {
            return Image(named!)
        } else {
            return Image(uiImage: isBlack ? wrImg(name: "back_arrow@2x") : wrImg(name: "back_arrow_white@2x"))
        }
    }

    private func wrImg(name: String, type: String = "png") -> UIImage {
        return UIImage(named: name, in: Bundle.wrNavigationBarBundle, compatibleWith: nil) ?? UIImage()
    }
}

struct WRDefaultBackButton_Previews: PreviewProvider {
    static var previews: some View {
        WRDefaultBackButton(isBlack: true)
    }
}
