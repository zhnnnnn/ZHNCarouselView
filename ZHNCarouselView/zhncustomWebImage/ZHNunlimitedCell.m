//
//  ZHNunlimitedCell.m
//  ZHNCarouselView
//
//  Created by zhn on 16/5/24.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ZHNunlimitedCell.h"

@interface ZHNunlimitedCell()



@end


@implementation ZHNunlimitedCell

- (void)layoutSubviews{
    
    [super layoutSubviews];
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView * backImageView = [[UIImageView alloc]init];
        [self addSubview:backImageView];
        self.backImageView = backImageView;
        self.backImageView.frame = self.bounds;
        backImageView.userInteractionEnabled = YES;
        
        
        UIView * labeBackView = [[UIView alloc]init];
        [self addSubview:labeBackView];
        labeBackView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        labeBackView.frame = CGRectMake(0, self.frame.size.height - 40, self.frame.size.width, 40);
        self.labelBackView = labeBackView;
        
        UILabel * noticeLabel = [[UILabel alloc]init];
        self.noticeLabel = noticeLabel;
        [labeBackView addSubview:noticeLabel];
        noticeLabel.textColor = [UIColor whiteColor];
    }
    return self;
}

@end
