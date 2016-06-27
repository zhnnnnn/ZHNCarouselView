Pod::Spec.new do |s|
  s.name             = "ZHNunlimitedCarouselView"    #名称
  s.version          = "1.0.0"             #版本号
  s.summary          = "无限轮播"     #简短介绍，下面是详细介绍
  s.homepage         = "https://github.com/zhnnnnn/ZHNCarouselView"
                       
  s.license          = 'MIT'              #开源协议
  s.author           = { "zhnnnnn" => "475816908@qq.com" }                   #作者信息
  s.source           = { :git => "https://github.com/zhnnnnn/ZHNCarouselView.git", :tag => "1.0.0" }      #项目地址，这里不支持ssh的地址，验证不通过，只支持HTTP和HTTPS，最好使用HTTPS
  s.platform     = :ios, '8.0'            #支持的平台及版本
  s.requires_arc = true                   #是否使用ARC，如果指定具体文件，则具体的问题使用ARC

  s.source_files = 'ZHNCarouselView/ZHNCarouselView/ZHNunlimitedCarouselView/**/*'   
  s.frameworks = 'UIKit'                  #所需的framework，多个用逗号隔开
end
