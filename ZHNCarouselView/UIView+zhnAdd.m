//
//  UIView+zhnAdd.m
//  RACzhihu
//
//  Created by zhn on 16/6/22.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "UIView+zhnAdd.h"

@implementation UIView (zhnAdd)
- (CGFloat)zhn_height{
    return self.frame.size.height;
}
- (CGFloat)zhn_width{
    return self.frame.size.width;
}
- (CGFloat)zhn_X{
    return self.frame.origin.x;
}
- (CGFloat)zhn_Y{
    return self.frame.origin.y;
}

- (void)zhn_setHeight:(CGFloat)height{
    CGRect oldFrame = self.frame;
    self.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, oldFrame.size.width, height);
}
- (void)zhn_setWidth:(CGFloat)width{
    CGRect oldFrame = self.frame;
    self.frame = CGRectMake(oldFrame.origin.x, oldFrame.origin.y, width, oldFrame.size.height);
}
- (void)zhn_setX:(CGFloat)x{
    CGRect oldFrame = self.frame;
    self.frame = CGRectMake(x, oldFrame.origin.y, oldFrame.size.width, oldFrame.size.height);
}
- (void)zhn_setY:(CGFloat)y{
    CGRect oldFrame = self.frame;
    self.frame = CGRectMake(oldFrame.origin.x, y, oldFrame.size.width,  oldFrame.size.height);
}

@end
