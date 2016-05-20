//
//  ViewController.m
//  ZHNCarouselView
//
//  Created by zhn on 16/5/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ViewController.h"
#import "ZHNcarouselView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray * imageAry = @[[UIImage imageNamed:@"tutu"],[UIImage imageNamed:@"tutu"],[UIImage imageNamed:@"tutu"],[UIImage imageNamed:@"tutu"],[UIImage imageNamed:@"tutu"]];
    NSArray * webImageAry = @[@"http://ww3.sinaimg.cn/thumbnail/e8dfdc42gw1ev6tr7t09yj20wp0ojdrz.jpg",@"http://ww3.sinaimg.cn/thumbnail/e8dfdc42gw1ev6tr7t09yj20wp0ojdrz.jpg",@"http://ww3.sinaimg.cn/thumbnail/e8dfdc42gw1ev6tr7t09yj20wp0ojdrz.jpg",@"http://ww1.sinaimg.cn/thumbnail/66f669cegw1ev6tp5whw1j20m80ceabf.jpg",@"http://ww1.sinaimg.cn/thumbnail/66f669cegw1ev6tp5whw1j20m80ceabf.jpg"];
    
    ZHNcarouselView *limitView = [ZHNcarouselView zhn_instancecarouselWithImageArray:webImageAry imageContentMode:ZHN_contentModeBottom placeHolder:[UIImage imageNamed:@"tutu"] TimeInterval:3 scrollviewFrame:CGRectMake(0, 100, 300, 300)];
//    limitView.pageControlShowMode = zhn_pageControlShowModeRight;
    [self.view addSubview:limitView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
