//
//  UIView+zhnAdd.h
//  RACzhihu
//
//  Created by zhn on 16/6/22.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (zhnAdd)
//============ 获取属性 ============//
- (CGFloat)zhn_height;
- (CGFloat)zhn_width;
- (CGFloat)zhn_X;
- (CGFloat)zhn_Y;
//============ 设置属性 ============//
- (void)zhn_setHeight:(CGFloat)height;
- (void)zhn_setWidth:(CGFloat)width;
- (void)zhn_setX:(CGFloat)x;
- (void)zhn_setY:(CGFloat)y;

@end
