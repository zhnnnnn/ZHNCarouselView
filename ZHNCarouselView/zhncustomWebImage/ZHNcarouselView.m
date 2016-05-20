//
//  ZHNcarouselView.m
//  ZHNCarouselView
//
//  Created by zhn on 16/5/20.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ZHNcarouselView.h"

@interface ZHNcarouselView()<UIScrollViewDelegate>
// scrollview
@property (weak, nonatomic)  UIScrollView * scrollView;
// 当前显示的图片
@property (weak, nonatomic)  UIImageView * currentImageView;
// 左边显示的图片
@property (weak, nonatomic)  UIImageView * leftImageView;
// 右边显示的图片
@property (weak, nonatomic)  UIImageView * rightImageView;
// 占位图片
@property (nonatomic,strong) UIImage * placeholderImage;
// 图片显示模式
@property (nonatomic,assign) ZHN_contentMode imageContentMode;
// 定时器时长
@property (nonatomic,assign) NSInteger timeInterVal;
// pageControl
@property (weak, nonatomic)  UIPageControl * imagePageControl;
// 处理数组只有两个的情况
@property (weak, nonatomic)  UIPageControl * dealWithArryCount2;
// 图片数组
@property (copy, nonatomic)   NSArray *imageAry;
// 计时器
@property (strong, nonatomic)  NSTimer * timer;
@end


@implementation ZHNcarouselView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        // 初始化控件
        [self initSubViews];
        
        // 添加手势识别
        [self initGesture];
    }
    return self;
}

+ (instancetype)zhn_instancecarouselWithImageArray:(NSArray *)webImageArray imageContentMode:(ZHN_contentMode)contentMode placeHolder:(UIImage *)placeHolderImage TimeInterval:(NSInteger)timeInterVal scrollviewFrame:(CGRect)frame{
    
    ZHNcarouselView * unlimitScrollview = [[ZHNcarouselView alloc]initWithFrame:frame];
    unlimitScrollview.imageAry = webImageArray;
    unlimitScrollview.imageContentMode = contentMode;
    unlimitScrollview.placeholderImage = placeHolderImage;
    unlimitScrollview.timeInterVal = timeInterVal;
    return unlimitScrollview;
}

- (void)initSubViews{
    
    // 1.scrollview
    UIScrollView * tempScrollview =[[UIScrollView alloc]init];
    [self addSubview:tempScrollview];
    self.scrollView = tempScrollview;
    tempScrollview.pagingEnabled = YES;
    // 不显示能够滑动的条
    tempScrollview.showsHorizontalScrollIndicator = NO;
    tempScrollview.showsVerticalScrollIndicator = NO;
    tempScrollview.delegate = self;
    tempScrollview.bounces = NO;
    
    // 2.当前显示的图片
    UIImageView * currentImageView = [[UIImageView alloc]init];
    currentImageView.userInteractionEnabled = YES;
    [tempScrollview addSubview:currentImageView];
    self.currentImageView = currentImageView;
    
    // 3.左边的图片
    UIImageView * leftImageView = [[UIImageView alloc]init];
    leftImageView.userInteractionEnabled = YES;
    [tempScrollview addSubview:leftImageView];
    self.leftImageView = leftImageView;
    
    // 4.右边的图片
    UIImageView * rightImageView = [[UIImageView alloc]init];
    rightImageView.userInteractionEnabled = YES;
    [tempScrollview addSubview:rightImageView];
    self.rightImageView = rightImageView;
    
    // 5.pageControl
    UIPageControl * imagePageContol = [[UIPageControl alloc]init];
    imagePageContol.pageIndicatorTintColor = [UIColor blackColor];
    [self addSubview:imagePageContol];
    self.imagePageControl = imagePageContol;
    // 6.只有两组数据的情况下做的处理
    UIPageControl * dealArryCount2PagCtl = [[UIPageControl alloc]init];
    dealArryCount2PagCtl.pageIndicatorTintColor = [UIColor blackColor];
    dealArryCount2PagCtl.currentPage = 0;
    dealArryCount2PagCtl.numberOfPages = 2;
    dealArryCount2PagCtl.hidden = YES;
    [self addSubview:dealArryCount2PagCtl];
    self.dealWithArryCount2 = dealArryCount2PagCtl;
}


- (void)layoutSubviews{
    
    CGFloat selfHeight = self.frame.size.height;
    CGFloat selfWidth = self.frame.size.width;
    
    // 1. scrollview
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(selfWidth * 3, selfHeight);
    
    // 2. currentimageView
    self.currentImageView.frame = CGRectMake(selfWidth, 0, selfWidth, selfHeight);
    
    // 3. leftImageView
    self.leftImageView.frame = CGRectMake(0, 0, selfWidth, selfHeight);
    
    // 4. rightImageView
    self.rightImageView.frame = CGRectMake(2 * selfWidth, 0, selfWidth, selfHeight);
    
    self.imagePageControl.numberOfPages = self.imageAry.count;
    self.imagePageControl.currentPage = 0;
    // pageCtl的位置
    self.imagePageControl.frame = CGRectMake( 0.5*selfWidth - 25 ,selfHeight -25, 50, 20);
    self.dealWithArryCount2.frame = self.imagePageControl.frame;
    
    CGSize controlSize = [_imagePageControl sizeForNumberOfPages:self.imageAry.count];
    if (self.pageControlShowMode) {
        switch (self.pageControlShowMode) {
                
            case zhn_pageControlShowModeLeft:
                self.imagePageControl.frame = CGRectMake(20, selfHeight - controlSize.height + 5, controlSize.width, controlSize.height);
                self.dealWithArryCount2.frame = self.imagePageControl.frame;
                break;
            case zhn_pageControlShowModeCenter:
                
                break;
            case zhn_pageControlShowModeRight:
                
                self.imagePageControl.frame = CGRectMake(selfWidth - 20 - controlSize.width, selfHeight - controlSize.height + 5, controlSize.width, controlSize.height);
                self.dealWithArryCount2.frame = self.imagePageControl.frame;
                break;
            default:
                break;
        }
    }
    
    
    // 对特殊的数组长度做处理
    if (self.imageAry.count == 1) {
        self.imagePageControl.hidden = YES;
        self.scrollView.scrollEnabled = NO;
        self.imageAry = @[self.imageAry[0],self.imageAry[0],self.imageAry[0]];
    }
    if (self.imageAry.count == 2) {
        self.imageAry = @[self.imageAry[0],self.imageAry[1],self.imageAry[0],self.imageAry[1]];
        
        self.dealWithArryCount2.hidden = NO;
        self.imagePageControl.hidden = YES;
    }
    // 选择图片
    [self updateImage];
    
    // 用到autolauyout 的情况下需要加这两句
    [super layoutSubviews];
    [self layoutIfNeeded];
}


- (void)initGesture{
    
    UITapGestureRecognizer * tapGes = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapTheScreen)];
    [self addGestureRecognizer:tapGes];
}

- (void)tapTheScreen{
    
    if ([self.delegate respondsToSelector:@selector(ZHNcarouselViewChoseTheIndex:)]) {
        if (self.imageAry.count == 2) {
            [self.delegate ZHNcarouselViewChoseTheIndex:self.dealWithArryCount2.currentPage];
        }else{
            [self.delegate ZHNcarouselViewChoseTheIndex:self.imagePageControl.currentPage];
        }
    }
}

// 这个方法是通过 pagecontrol显示的数值去计算
- (void)updateImage{
    
    NSInteger index = self.imagePageControl.currentPage;
    
    if (index == 0) { // 特殊情况 显示第一张
        if ([self.imageAry[0] isKindOfClass:[NSString class]]) {
            [self setWebImageWithWebImageAry:@[self.imageAry[0],[self.imageAry lastObject],self.imageAry[1]]];
            
            // 用gcd 的方法让 startTimer 这个方法只执行一次
            static dispatch_once_t onceToken;
            dispatch_once(&onceToken, ^{
                [self startTimer];
            });
            
        }else{
            [self setLocalImageWithLocalImageAry:@[self.imageAry[0],[self.imageAry lastObject],self.imageAry[1]]];
        }
        
        self.currentImageView.tag = 0;
        self.leftImageView.tag = self.imageAry.count-1;
        self.rightImageView.tag = 1;
        
        
    }else if(index == self.imageAry.count - 1){ // 特殊情况 显示最后一张
        
        
        if ([[self.imageAry lastObject] isKindOfClass:[NSString class]]) {
            [self setWebImageWithWebImageAry:@[[self.imageAry lastObject],self.imageAry[self.imageAry.count-2],self.imageAry[0]]];
            
        }else{
            [self setLocalImageWithLocalImageAry:@[[self.imageAry lastObject],self.imageAry[self.imageAry.count-2],self.imageAry[0]]];
        }
        
        self.currentImageView.tag = self.imageAry.count - 1;
        self.leftImageView.tag = self.imageAry.count - 2;
        self.rightImageView.tag = 0;
        
    }else{ // 正常的情况下
        
        if ([self.imageAry[index] isKindOfClass:[NSString class]]) {
            
            [self setWebImageWithWebImageAry:@[self.imageAry[index],self.imageAry[index-1],self.imageAry[index+1]]];
            
        }else{
            [self setLocalImageWithLocalImageAry:@[self.imageAry[index],self.imageAry[index-1],self.imageAry[index+1]]];
        }
        
        self.currentImageView.tag = index;
        self.leftImageView.tag = index - 1;
        self.rightImageView.tag = index + 1;
    }
    // 这步相当于把scrollview拉回到中间
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
}


- (void)setWebImageWithWebImageAry:(NSArray *)webArray{
    
    [self.currentImageView zhn_setImageWithUrl:webArray[0] withContentMode:self.imageContentMode placeHolder:self.placeholderImage];
    [self.leftImageView zhn_setImageWithUrl:webArray[1] withContentMode:self.imageContentMode placeHolder:self.placeholderImage];
    [self.rightImageView zhn_setImageWithUrl:webArray[2] withContentMode:self.imageContentMode placeHolder:self.placeholderImage];
    
}

- (void)setLocalImageWithLocalImageAry:(NSArray *)localArray{
    
    self.currentImageView.image = localArray[0];
    self.leftImageView.image = localArray[1];
    self.rightImageView.image = localArray[2];
}

// 三个imageview 的frame.x和contentoffset的x比较 绝对值最小的就是当前显示的图片
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat currtX = ABS(self.currentImageView.frame.origin.x - scrollView.contentOffset.x);
    CGFloat leftX = ABS(self.leftImageView.frame.origin.x - scrollView.contentOffset.x);
    CGFloat rightX = ABS(self.rightImageView.frame.origin.x - scrollView.contentOffset.x);
    
    CGFloat temp = currtX;
    
    // 找出最小值
    if (temp > leftX) {
        temp = leftX;
        if (temp > rightX) {
            temp = rightX;
        }
    }else if(temp > rightX){
        temp = rightX;
    }
    
    // 对pagectl 赋值
    if (temp == currtX) {
        self.imagePageControl.currentPage = self.currentImageView.tag ;
    }else if(temp == leftX){
        self.imagePageControl.currentPage = self.leftImageView.tag;
    }else if(temp == rightX){
        self.imagePageControl.currentPage = self.rightImageView.tag;
    }
    // 图片数据为2的特殊处理
    if (self.imagePageControl.currentPage < 2) {
        self.dealWithArryCount2.currentPage = self.imagePageControl.currentPage;
    }else{
        self.dealWithArryCount2.currentPage = self.imagePageControl.currentPage - 2;
    }
    
    
}
#pragma mark - set方法来初始化一些值
- (void)setPageControlNormalColor:(UIColor *)pageControlNormalColor{
    _pageControlNormalColor = pageControlNormalColor;
    self.imagePageControl.pageIndicatorTintColor = pageControlNormalColor;
    self.dealWithArryCount2.pageIndicatorTintColor = pageControlNormalColor;
}

- (void)setPageControlSelectedColor:(UIColor *)pageControlSelectedColor{
    _pageControlSelectedColor = pageControlSelectedColor;
    self.imagePageControl.currentPageIndicatorTintColor = pageControlSelectedColor;
    self.dealWithArryCount2.currentPageIndicatorTintColor = pageControlSelectedColor;
}

#pragma mark - 定时器的处理
// 结束拖拽的时候要删除定时器
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
     [self startTimer];
}

// 拖拽开始的时候要添加定时器
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self endTimer];
}


// 当滚动停止的时候 重新根据pagectl去设置 contentoffset 和需要显示的图片
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self updateImage];
}

// 因为自动定时图片跳转结束的时候也要重置下
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self updateImage];
}

- (void)startTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterVal target:self selector:@selector(nextPick) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}

- (void)endTimer{
    
    // 停止计时 删除计时器
    [self.timer invalidate];
    self.timer = nil;
    
}

- (void)nextPick{
    
    [self.scrollView setContentOffset:CGPointMake(2 * self.frame.size.width, 0) animated:YES];
}
@end
