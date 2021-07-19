# SwiftUI 技术交流
我创建了一个 SwiftUI 技术交流群，欢迎小伙伴们加入一起交流学习~

可以加我微信我拉你进去（备注swiftui），我的微信号 wr1204607318

# SwiftUI-WRNavigationBar
custom navigationBar in swiftui


## Requirements
iOS 14.0

## Installation
pod 'SwiftUI-WRNavigationBar', '~>1.1.1'


## Overview
|debug|custom title view|custom title view search|
|:-:|:-:|:-:|
|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/debug.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/custom%20title%20view.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/custom%20title%20view%20search.gif)|

|leadingView&trailingView|foreground|hidden bottom line|
|:-:|:-:|:-:|
|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/LeadingView%26TrailingView.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/foreground.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/hidden%20bottom%20line.gif)|

|background image|background linearGradient|update background alpha|
|:-:|:-:|:-:|
|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/set%20background%20image.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/set%20background%20linearGradient.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/update%20background%20alpha.gif)|

|intercept back event|ignore top area|
|:-:|:-:|
|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/intercept%20backBtn%20event.gif)|![](https://github.com/wangrui460/SwiftUI-WRNavigationBar/blob/main/screenshots/ignore%20top%20area.gif)|


### Example

<pre><code>
struct ForegroundView: View {
    var body: some View {
        WRNavigationBar {
            ListView()
        }
        .title("set foreground")
        .foreground(.white)
        .isBackButtonBlack(false)
        .background(Color.blue)
    }
}
</code></pre>

### Api

|api|description|
|------|-------|
| foreground(_ foreground: Color) | foreground |
| title(_ title: String) | title (titleView is default) |
| hiddenLine(_ hidden: Bool) | Is the line at the bottom of the navigationBar hidden |
| backButtonImageName(_ named: String) | Set backButton image name |
| backButtonHidden(_ hidden: Bool) | Is the backButton hidden |
| isBackButtonBlack(_ isBlack: Bool) | Is the backButton black style |
| ignoringTopArea(_ ignore: Bool) | Is the content align with the top of the navigationBar |
| maxWidth(leading: CGFloat = 80, trailing: CGFloat = 80) | Max width of leadingView  and max width of trailingView |
| background<Background>(_ background: Background) | background |
| backButtonTapAction(_ tapAction: @escaping WRBlock) | backButton intercept（ hasBackButton == true） |
| debug(_ debug: Bool) | debug |
| navigationBarTitleView<Content: View>(@ViewBuilder titleView: () -> Content) | titleView |
| wrNavigationBarItems<Leading: View, Trailing: View>(leading:xx, trailing:xx) | navigationBarItems  leading & trailing |
| wrNavigationBarItems<Content: View>(@ViewBuilder leading: () -> Content) | navigationBarItems leading |
| wrNavigationBarItems<Content>(trailing: () -> Content) | navigationBarItems trailing |
     
    
# License
SwiftUI-WRNavigationBar is available under the MIT license. See the LICENSE file for more info.
