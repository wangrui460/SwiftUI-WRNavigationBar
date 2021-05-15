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
            Text("测试")
        }
    }
}

/// 自定义导航栏
struct WRNavigationBar<Content>: View where Content: View {

    private var foreground: Color
    // 标题
    private var title: String
    // 隐藏底部线？
    private var hiddenLine: Bool
    // 有 leadingItems 时是否还保留 backBtn
    private var keepBackBtn4LeadingItems: Bool
    // backBtn 事件拦截
    private var backBtnTapAction: WRBlock?
    // 返回按钮是黑色的？
    private var isBackBtnBlack: Bool
    // 忽略顶部区域？
    private var ignoringTopArea: Bool
    // 导航栏背景
    private var background: WRBackgroundView
    private var titleView: WRTitleView
    private var leadingView: WRLeadingView
    private var trailingView: WRTrailingView
    // 内容
    private let content: Content
    // 左侧最大宽度
    private let leadingMaxWidth: CGFloat = 100
    // 右侧最大宽度
    private let trailingMaxWidth: CGFloat = 100

    var body: some View {
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
                        if keepBackBtn4LeadingItems {
                            WRDefaultBackButton(tapAction: backBtnTapAction, isBlack: isBackBtnBlack, foreground: foreground)
                        }
                        leadingView
                        Spacer()
                    }
                    .frame(maxWidth: leadingMaxWidth)

                    // title
                    HStack {
                        Spacer()
                        titleView
                        Spacer()
                    }

                    // trailing
                    HStack {
                        Spacer()
                        trailingView
                    }
                    .frame(maxWidth: trailingMaxWidth)
                }
                .frame(height: WRHelper.NavigationBar.height)
                .padding(.top, WRHelper.UnsafeArea.top)
                .padding(.horizontal, 15)
                .foregroundColor(foreground)
                .background(background)

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

    public init(
        foreground: Color = .black,
        title: String = "",
        hiddenLine: Bool = true,
        keepBackBtn4LeadingItems: Bool = true,
        isBackBtnBlack: Bool = true,
        ignoringTopArea: Bool = false,
        @ViewBuilder content: () -> Content) {
        self.foreground = foreground
        self.title = title
        self.hiddenLine = hiddenLine
        self.keepBackBtn4LeadingItems = keepBackBtn4LeadingItems
        self.isBackBtnBlack = isBackBtnBlack
        self.ignoringTopArea = ignoringTopArea
        self.background = WRBackgroundView()
        self.titleView = WRTitleView()
        self.titleView.content = AnyView(WRDefaultTitleView(title: self.title, foreground: self.foreground))
        self.leadingView = WRLeadingView()
        self.trailingView = WRTrailingView()
        self.content = content()
    }

    /// 自定义导航栏背景
    public func customNavigationBarBackground<Background>(_ background: Background) -> WRNavigationBar where Background: View {
        var result = self
        result.background.content = AnyView(background)
        return result
    }

    /// backBtn 事件拦截 （当 keepBackBtn4LeadingItems == true）
    public func customNavigationBarBackBtnTapAction(_ tapAction: @escaping WRBlock) -> WRNavigationBar {
        var result = self
        result.backBtnTapAction = tapAction
        return result
    }

    /// 设置 titleView
    public func customNavigationBarTitle<Content: View>(@ViewBuilder titleView: () -> Content) -> some View {
        let titleV = titleView()
        var result = self
        result.titleView.content = AnyView(titleV)
        return result
    }

    /// 设置 左侧和右侧视图
    public func customNavigationBarItems<Leading: View, Trailing: View>(
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

    /// 设置 左侧视图
    public func customNavigationBarItems<Content: View>(@ViewBuilder leading: () -> Content) -> some View {
        let v = leading()
        var result = self
        result.leadingView.content = AnyView(v)
        return result
    }

    /// 设置 右侧视图
    public func customNavigationBarItems<Content: View>(@ViewBuilder trailing: () -> Content) -> some View {
        let v = trailing()
        var result = self
        result.trailingView.content = AnyView(v)
        return result
    }
}
