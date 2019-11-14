# DarkMode
暗黑模式适配的一点小技巧


Layer：
在iOS13 适配暗黑模式时，发现CALayer层设置的CGColor并不可以在切换暗黑模式时自动转换。

网上搜寻大家的做法，也基本都是在traitCollectionDidChange:中改变颜色。

在我实际开发中，有着大量圆角、阴影、边框、渐变等。为了追求一丢丢性能，我大都是用了各种layer。使用layer分类解决减少了不少工作量。

图片：
图片设置圆角、部分圆角等时使用了blend方法，这里因为已经颜色信息等画好了，直接从backStore中拿，重新加载也不会改变颜色，需要重新绘制。、

切换模式时，系统回调traitCollectionDidChange:、viewDidLayoutSubViews等方法，按照逻辑来讲，从layer的display（）到drawInRect：等方法都可以重新设置颜色绘制，但实际发现其他方法不一定能拿到需要的layer

在app挂起时，iOS就会分别使用暗黑和正常模式对应用截屏，然后使用当前模式的截屏，此时应当注意去掉隐式动画

有问题：
  在tableView中，遇到在重用、reloadData时个别cell没有调用layoutSubViews方法，原因未知。cell的willDisplay：中手动调用了cell.contentView.setNeedsLayout() 临时解决

注：只包含了我使用的layer种类。


webView： 实际的webView适配是应当前端配合，iOS只能假装改一改body的背景、字体颜色
  在webView加载时，会白色闪屏一下，使用一个view盖住，加载完成后延迟一丢丢时间hide就好了
