//
//  ZHNcarouselView.h
//  ZHNCarouselView
//
//  Created by zhn on 16/5/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+ZHNimageCache.h"

typedef NS_ENUM(NSInteger,zhn_pageControlShowMode){
    zhn_pageControlShowModeLeft,
    zhn_pageControlShowModeCenter,
    zhn_pageControlShowModeRight
};

@protocol ZHNcarouselViewDelegate <NSObject>
@optional

- (void)ZHNcarouselViewChoseTheIndex:(NSInteger)index;

@end


@interface ZHNcarouselView : UIView
/**
 *  轮播图的代理
 */
@property (weak, nonatomic)  id<ZHNcarouselViewDelegate>delegate;
/**
 *  选中的颜色 (不填颜色默认白色)
 */
@property (nonatomic,strong) UIColor * pageControlSelectedColor;
/**
 *  普通的颜色 (不填颜色默认黑色)
 */
@property (nonatomic,strong) UIColor * pageControlNormalColor;
/**
 *  pagetrol的显示模式（不填默认在中间）
 */
@property (nonatomic,assign) zhn_pageControlShowMode pageControlShowMode;
/**
 *  初始化方法
 *
 *  @param webImageArray    图片数组（可以是网络图片，也可以是本地图片但是必须都是url或者都是图片，不能混合）
 *  @param contentMode      图片的显示模式
 *  @param placeHolderImage 占位图片
 *  @param timeInterVal     自动播放的时长
 *  @param frame            控件的frame
 *
 *  @return 轮播图实例
 */
+ (instancetype)zhn_instancecarouselWithImageArray:(NSArray *)webImageArray imageContentMode:(ZHN_contentMode)contentMode placeHolder:(UIImage *)placeHolderImage TimeInterval:(NSInteger)timeInterVal scrollviewFrame:(CGRect)frame;
@end
