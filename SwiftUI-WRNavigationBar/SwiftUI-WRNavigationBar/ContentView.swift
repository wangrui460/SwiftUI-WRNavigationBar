//
//  ContentView.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/5/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WRNavigationBar {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 0) {
                        VStack(spacing: 0) {
                            NavigationLink(
                                destination: LeadingAndTrailingView(),
                                label: {
                                    DemoCell(title: "leadingView and trailingView")
                                })

                            NavigationLink(
                                destination: ForegroundView(),
                                label: {
                                    DemoCell(title: "set foreground white")
                                })

                            NavigationLink(
                                destination: HiddenBottomLineView(),
                                label: {
                                    DemoCell(title: "hidden bottom line")
                                })

                            NavigationLink(
                                destination: IgnoreTopAreaView(),
                                label: {
                                    DemoCell(title: "ignoreTopArea")
                                })

                            NavigationLink(
                                destination: BackButtonTapActionView(),
                                label: {
                                    DemoCell(title: "intercept backButton event")
                                })
                        }

                        VStack {
                            NavigationLink(
                                destination: BackgroundView1(),
                                label: {
                                    DemoCell(title: "set background image")
                                })

                            NavigationLink(
                                destination: BackgroundView2(),
                                label: {
                                    DemoCell(title: "set background LinearGradient")
                                })

                            NavigationLink(
                                destination: BackgroundView3(),
                                label: {
                                    DemoCell(title: "update background alpha when scroll")
                                })

                            NavigationLink(
                                destination: TitleView(),
                                label: {
                                    DemoCell(title: "set titleView")
                                })

                            NavigationLink(
                                destination: TitleSearchView(),
                                label: {
                                    DemoCell(title: "set titleView search")
                                })

                            NavigationLink(
                                destination: DebugView(),
                                label: {
                                    DemoCell(title: "debug")
                                })
                        }
                    }
                }
            }
            .title("SwiftUI-WRNavigationBar")
            .hiddenLine(false)
            .background(Color.blue)
            .backButtonHidden(true)
        }
    }
}

struct DemoCell: View {
    var title: String
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.title3)
                .foregroundColor(.black)
                .frame(height: 60)
            Divider()
                .frame(maxWidth: UIScreen.main.bounds.width)
                .padding(.leading, 15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
