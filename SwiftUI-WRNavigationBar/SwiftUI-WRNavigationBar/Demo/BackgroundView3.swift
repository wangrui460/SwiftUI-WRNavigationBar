//
//  BackgroundView3.swift
//  SwiftUI-WRNavigationBar
//
//  Created by 王锐 on 2021/5/16.
//

import SwiftUI

struct BackgroundView3: View {
    @Environment(\.presentationMode) var presentationMode
    @State var opacity: Double = 0
    var body: some View {
        WRNavigationBar {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    Image("bg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .background(
                            GeometryReader { geo in
                                Color.clear.preference(
                                    key: ViewOffsetKey.self,
                                    value: geo.frame(in: .named("scroll")).origin.y)
                            }
                        )
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
                .onPreferenceChange(ViewOffsetKey.self, perform: { value in
                    if value > -200 {
                        opacity = 0
                    } else {
                        opacity = 1
                    }
                })
            }
            .coordinateSpace(name: "scroll")
        }
        .ignoringTopArea(true)
        .title("标题")
        .foreground(opacity == 1 ? .black : .white)
        .background(
            Color.white
                .opacity(opacity)
                .animation(.default)
        )
        .backButtonHidden(true)
        .wrNavigationBarItems(leading: {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("返回")
                    .foregroundColor(opacity == 1 ? .black : .white)
            })
        })
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct BackgroundView3_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView3()
    }
}
