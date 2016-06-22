//
//  ViewController.m
//  ZHNCarouselView
//
//  Created by zhn on 16/5/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ViewController.h"
#import "ZHNunlimitedCarouselView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZHNunlimitedCarouselView * temp = [ZHNunlimitedCarouselView zhn_instanceCarouselViewUseImageArray:@[] frame:CGRectMake(0, 0, self.view.frame.size.width, 200) placeHolder:[UIImage imageNamed:@"tutu"] imageContentMode:ZHN_contentModeDefault pageControlMode:pageControlModeRight timerTime:5 didSelectItemBlock:^(NSInteger index) {
        NSLog(@"%ld",(long)index);
    }];
    
    temp.imageArray = @[@"http://a1.hoopchina.com.cn/attachment/Day_091231/176_2698549_edf68aafc659ca6.jpg",@"http://wenwen.soso.com/p/20090316/20090316192531-1838945174.jpg",@"http://img4.imgtn.bdimg.com/it/u=1196012006,634290422&fm=21&gp=0.jpg",@"http://img1.gtimg.com/2/275/27542/2754231_500x500_0.jpg",@"http://f1.diyitui.com/63/b1/b6/64/ea/5d/1b/d9/a1/bf/f8/84/6e/e4/ab/4e.jpg"];
    temp.defaultZhnModeStatusViewMode = UIViewContentModeScaleAspectFill;
    temp.noticeLabelArray = @[@"来了",@"哈哈哈",@"手打",@"哈请求",@"💰"];
    temp.noticeLabelFrame = CGRectMake(0, 0, 100, 40);
    
    [self.view addSubview:temp];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
