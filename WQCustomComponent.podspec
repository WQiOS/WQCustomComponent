#
#  Be sure to run `pod spec lint WQCustomComponent.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

s.name         = "WQCustomComponent"
s.version      = "0.0.5"
s.summary      = "私人总结的插件"

s.description  = <<-DESC
私人总结的一些小插件，欢迎使用并指正，谢谢。
DESC

s.homepage     = "https://github.com/WQiOS/WQCustomComponent"
s.license      = "MIT"
s.author             = { "王强" => "1570375769@qq.com" }
s.platform     = :ios, "8.0" #平台及支持的最低版本
s.requires_arc = true # 是否启用ARC
s.source       = { :git => "https://github.com/WQiOS/WQCustomComponent.git", :tag => "#{s.version}" }

s.ios.framework  = 'UIKit'

s.subspec 'WQDanmakuView' do |dandmakuView|
dandmakuView.source_files = "WQCustomComponent/WQDanmakuView/*.{h,m}"
end

s.subspec 'WQWebview' do |webview|
webview.source_files = "WQCustomComponent/WQWebview/*.{h,m}"
end

s.subspec 'WQScreenshotDrawView' do |scrseenshot|
scrseenshot.source_files = "WQCustomComponent/WQScreenshotDrawView/*.{h,m}"
end

s.subspec 'WQCacheManage' do |cacheManage|
cacheManage.source_files = "WQCustomComponent/WQCacheManage/*.{h,m}"
end

s.subspec 'WQCAEmitterButton' do |emitterButton|
emitterButton.source_files = "WQCustomComponent/WQCAEmitterButton/*.{h,m}"
end

end

