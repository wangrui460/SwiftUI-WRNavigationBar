//
//  WRNavigationBar.swift
//  SwiftUI-WRNavigationBar
//
//  Created by wangrui460 on 2021/4/15.
//

import SwiftUI

struct WRNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        WRNavigationBar {
            Text("test")
        }
    }
}

/// custom navigationBar
public struct WRNavigationBar<Content>: View where Content: View {

    // The title of navigationBar (titleView default)
    private var title: String = ""

    // The titleView is default
    private var isDefaultTitleView: Bool = true

    // TitleView of navigationBar
    private var titleView: WRTitleView

    // The foreground of navigationBar
    private var foreground: Color = .black

    // Background of navigationBar
    private var background: WRBackgroundView

    // Hide the line at the bottom of the navigationBar
    private var hiddenLine: Bool = true

    // Has backButton of default on the navigationBar
    private var hasBackButton: Bool = true

    // Set backButton image name
    private var backButtonImageName: String?

    // Set backButton tapAction
    private var backButtonTapAction: WRBlock? = nil

    // Is backButton black style
    private var isBackButtonBlack: Bool = true

    // Is the content align with the top of the navigationBar
    private var ignoringTopArea: Bool = false

    // LeadingView of navigationBar
    private var leadingView: WRLeadingView

    // TrailingView of navigationBar
    private var trailingView: WRTrailingView

    // Max width of leadingView
    private var leadingMaxWidth: CGFloat = 80

    // Max width of trailingView
    private var trailingMaxWidth: CGFloat = 80

    // isDebug
    private var isDebug: Bool = false

    // Content view between navigationBar
    private let content: Content

    public var body: some View {
        ZStack(alignment: .top) {
            ZStack {
                Color.clear
                content
            }
            .padding(.top, ignoringTopArea ? 0 : WRHelper.NavigationBar.bottom)
            .frame(maxHeight: WRHelper.height)

            ZStack(alignment: .bottom) {
                HStack(alignment: .center, spacing: 0) {
                    // leading
                    HStack(spacing: 0) {
                        if hasBackButton {
                            WRDefaultBackButton(named: backButtonImageName, tapAction: backButtonTapAction, isBlack: isBackButtonBlack, foreground: foreground)
                        }
                        leadingView
                        Spacer()
                    }
                    .padding(.leading, 15)
                    .frame(maxWidth: leadingMaxWidth)
                    .background(isDebug ? Color.red : Color.clear)

                    // title
                    titleView
                        .frame(maxWidth: .infinity)
                        .background(isDebug ? Color.green : Color.clear)

                    // trailing
                    HStack(spacing: 0) {
                        Spacer()
                        trailingView
                    }
                    .padding(.trailing, 15)
                    .frame(maxWidth: trailingMaxWidth)
                    .background(isDebug ? Color.red : Color.clear)
                }
                .frame(height: WRHelper.NavigationBar.height)
                .padding(.top, WRHelper.UnsafeArea.top)
                .foregroundColor(foreground)
                .background(background)
                .clipped()

                // line
                if !hiddenLine {
                    Divider()
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

extension WRNavigationBar {

    public init(@ViewBuilder content: () -> Content) {
        self.background = WRBackgroundView()
        self.titleView = WRTitleView()
        self.leadingView = WRLeadingView()
        self.trailingView = WRTrailingView()
        self.content = content()
    }

    /// The foreground of navigationBar
    public func foreground(_ foreground: Color) -> WRNavigationBar {
        var result = self
        result.foreground = foreground
        if isDefaultTitleView {
            result.titleView.content = AnyView(WRDefaultTitleView(title: self.title, foreground: foreground))
        }
        return result
    }

    /// The title of navigationBar (titleView default)
    public func title(_ title: String) -> WRNavigationBar {
        var result = self
        result.title = title
        result.titleView.content = AnyView(WRDefaultTitleView(title: title, foreground: self.foreground))
        return result
    }

    /// Is the line at the bottom of the navigationBar hidden
    public func hiddenLine(_ hidden: Bool) -> WRNavigationBar {
        var result = self
        result.hiddenLine = hidden
        return result
    }

    /// Set backButton image name
    public func backButtonImageName(_ named: String)
    -> WRNavigationBar {
        var result = self
        result.backButtonImageName = named
        return result
    }

    /// Is the backButton hidden
    public func backButtonHidden(_ hidden: Bool)
    -> WRNavigationBar {
        var result = self
        result.hasBackButton = !hidden
        return result
    }

    /// Is the backButton black style
    public func isBackButtonBlack(_ isBlack: Bool) -> WRNavigationBar {
        var result = self
        result.isBackButtonBlack = isBlack
        return result
    }

    /// Is the content align with the top of the navigationBar
    public func ignoringTopArea(_ ignore: Bool) -> WRNavigationBar {
        var result = self
        result.ignoringTopArea = ignore
        return result
    }

    /// Max width of leadingView  and max width of trailingView
    public func maxWidth(leading: CGFloat = 80, trailing: CGFloat = 80) -> WRNavigationBar {
        var result = self
        result.leadingMaxWidth = leading
        result.trailingMaxWidth = trailing
        return result
    }
    
    /// background
    public func background<Background>(_ background: Background)
    -> WRNavigationBar where Background: View {
        var result = self
        result.background.content = AnyView(background)
        return result
    }

    /// backButton intercept（ hasBackButton == true）
    public func backButtonTapAction(_ tapAction: @escaping WRBlock)
    -> WRNavigationBar {
        var result = self
        result.backButtonTapAction = tapAction
        return result
    }

    /// debug
    public func debug(_ debug: Bool) -> WRNavigationBar {
        var result = self
        #if DEBUG
        result.isDebug = debug
        #endif
        return result
    }

    /// titleView
    public func navigationBarTitleView<Content: View>(@ViewBuilder titleView: () -> Content) -> some View {
        let titleV = titleView()
        var result = self
        result.isDefaultTitleView = false
        result.titleView.content = AnyView(titleV)
        return result
    }

    /// navigationBarItems  leading & trailing
    public func wrNavigationBarItems<Leading: View, Trailing: View>(
        @ViewBuilder leading: () -> Leading,
        @ViewBuilder trailing: () -> Trailing)
    -> some View {
        let vL = leading()
        let vT = trailing()
        var result = self
        result.leadingView.content = AnyView(vL)
        result.trailingView.content = AnyView(vT)
        return result
    }

    /// navigationBarItems leading
    public func wrNavigationBarItems<Content: View>(@ViewBuilder leading: () -> Content) -> some View {
        let v = leading()
        var result = self
        result.leadingView.content = AnyView(v)
        return result
    }

    /// navigationBarItems trailing
    public func wrNavigationBarItems<Content: View>(@ViewBuilder trailing: () -> Content) -> some View {
        let v = trailing()
        var result = self
        result.trailingView.content = AnyView(v)
        return result
    }
}
