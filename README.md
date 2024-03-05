# WeING

### 更新XCode 15之后的问题：

问题报告：

```
SDK does not contain 'libarclite' at the path '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/arc/libarclite_iphonesimulator.a'; try increasing the minimum deployment target
```

> libarclite 对于旧操作系统版本是必需的，但现在已过时。如果您遇到引用此库的错误，您应该审核项目中的每个目标，以查找那些声明支持**iOS 11 下的最低部署目标的目标，并将它们至少更新到 iOS 11**或更新的版本。您不应修改 Xcode 安装来解决此问题。

问题出在 Cocoapods 项目的最低操作系统版本上

解决方案：

1. 修改Podfile：`platform :ios, '13.0'`

2. 在项目导航器中`Pod`项中修改iOS部署目标版本。修改为最低版本iOS13

3. 在Podfile文末添加如下代码。自动将所有 pod 目标更改为 iOS 13`pod install`

```lua
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["IPHONEOS_DEPLOYMENT_TARGET"] = "13.0"
    end
  end
end
```