//
//  ZHNunlimitedCarouselView.h
//  ZHNCarouselView
//
//  Created by zhn on 16/5/24.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+ZHNimage.h"

typedef void (^ZhnCarouselViewDidSelectItemBlock)(NSInteger index);
typedef NS_ENUM(NSInteger,pageControlMode){
    
    pageControlModeLeft,
    pageControlModeCenter,
    pageControlModeRight
};


@interface ZHNunlimitedCarouselView : UIView

+ (instancetype)zhn_instanceCarouselViewUseImageArray:(NSArray *)imageArray frame:(CGRect)frame placeHolder:(UIImage *)placeHolderImage imageContentMode:(ZHN_contentMode)contentMode pageControlMode:(pageControlMode)ctrolMode timerTime:(NSInteger)timeInterval didSelectItemBlock:(ZhnCarouselViewDidSelectItemBlock)selectItemBlock;

/**
 *  清空缓存
 */
- (void)clearCache;
@end
