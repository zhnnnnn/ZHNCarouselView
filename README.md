# ZHNCarouselView
无限滚动 轮播 不依赖第三方 自带缓存 下载 自动处理图片的拉伸问题 因为系统的contentmode感觉老是缺少点什么，于是我自己写了个处理图片的category，但是如果你不把处理完的图片存起来的话相当于要经常去异步绘制，感觉吃cpu性能。所以借鉴sdweimage写了个图片下载和缓存的框架。但是这个下载的框架比较简易，所以在特定的一些情况下还是会存在些许问题。但是用在轮播这里基本没啥问题。于是我就写了这个框架配合以前写的无限轮播，但是问题两者配合起来还是问题有点严重，因为以前的思路要经常设contentoffset 会有一闪一闪的效果。。。痛定思痛 现在用了uicollectionview来实现，虽然理论上不是无限滚动，但是实际情况就是基本不可能滑到头。。。。。。。。今天头好痛~不知道是不是用脑过度了啊。。。。。。。

-----------------------------------------华丽的分割线-----------------------------------------------

######我最近对这个轮播做了点修改和加了点功能。还是放几张图片展示一些基本效果好了

`ZHN_contentModeTop` 对应
![top](https://raw.githubusercontent.com/zhnnnnn/ZHNCarouselView/master/top.png)
`ZHN_contentModeCenter` 对应
![center](https://raw.githubusercontent.com/zhnnnnn/ZHNCarouselView/master/center.png)
`ZHN_contentModeBottom` 对应
![bottom](https://raw.githubusercontent.com/zhnnnnn/ZHNCarouselView/master/bottom.png)


看这几张图片大概能看出来一些效果，还有left right 模式在这个尺寸的图片下显示不太明显的就不截图了。。。里面的图片缓存下载是我仿照sdwebImage写的一个简陋版本，在这种地方显然是够用了。具体什么用法应该看demo就一目了然了而且我对各种属性的设置都写了注释了。虽然没什么人看或者用。。但是如果你有幸能看到这个库有幸能用到这个库，提点意见给个star我还是很开心的~~~~~~~~~~~~~~~~


---
隔壁公司说要用这个轮播，所以我往cocoapods上面传了一下
##### 如何使用
###### 1.引入工程
<1 下载下工程吧`ZHNunlimitedCarouselView`整个文件夹导入进去
<2 或者你可以cocoapods     pod 'ZHNunlimitedCarouselView', '~> 1.0.0'
###### 2.具体使用步骤
提供了一个全能初始化方法 
```
    ZHNunlimitedCarouselView * temp = [ZHNunlimitedCarouselView zhn_instanceCarouselViewUseImageArray:@[@"http://a1.hoopchina.com.cn/attachment/Day_091231/176_2698549_edf68aafc659ca6.jpg",@"http://wenwen.soso.com/p/20090316/20090316192531-1838945174.jpg",@"http://img4.imgtn.bdimg.com/it/u=1196012006,634290422&fm=21&gp=0.jpg",@"http://img1.gtimg.com/2/275/27542/2754231_500x500_0.jpg",@"http://f1.diyitui.com/63/b1/b6/64/ea/5d/1b/d9/a1/bf/f8/84/6e/e4/ab/4e.jpg"] frame:CGRectMake(0, 0, self.view.frame.size.width, 200) placeHolder:[UIImage imageNamed:@"tutu"] imageContentMode:ZHN_contentModeCenter pageControlMode:pageControlModeRight timerTime:10 didSelectItemBlock:^(NSInteger index) {
        NSLog(@"%ld",(long)index);
    }];
```
如果你想要显示文字背景 设置以下参数
```
    temp.noticeLabelArray = @[@"来了",@"哈哈哈",@"手打",@"哈请求",@"💰"];
    temp.noticeLabelFrame = CGRectMake(20, 0, 100, 40);
    temp.labelBackViewColor = [UIColor blackColor];
```
