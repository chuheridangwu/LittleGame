//
//  ContentView.m
//  LittleGame
//
//  Created by dym on 16/11/7.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "BottonView.h"
#import "HeardView.h"
#import "ContentView.h"
#import "DidView.h"
#import "Header.h"

#define XB_ScreenSize  [UIScreen mainScreen].bounds.size

@interface BottonView ()<ContentViewDelegate>
@property (nonatomic,strong)NSArray *bgArray;
@property (nonatomic,strong)HeardView *heardView;
@property (nonatomic,strong)ContentView *ctnView;
@property (nonatomic,strong)DidView *didView;
@end

@implementation BottonView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        bgImg.userInteractionEnabled = YES;
        NSInteger count = arc4random() % self.bgArray.count;
        bgImg.image = [UIImage imageNamed:self.bgArray[count]];
        [self addSubview:bgImg];
        [bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [bgImg addSubview:self.heardView];
        [self.heardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(80);
            make.right.equalTo(-30);
            make.height.equalTo(60);
        }];
       

        [bgImg addSubview:self.ctnView];
        [self.ctnView setBgImg:[UIImage imageNamed:[self colorArray][count]]];
        [self.ctnView setCententVackImg:[UIImage imageNamed:[self cententBgColor][count]]];
        
        [bgImg addSubview:self.didView];
        
    }
    return self;
}

- (void)clickErrorMessage{
    [self.didView didViewReductionLiveImg];
    
    [self determineWhetherReload];
}

//判断是否调用代理
- (void)determineWhetherReload{
    static int i = 0;
    i++;
    if (i == 4) {
        i = 0;
        if ([self.delegate respondsToSelector:@selector(clickContentViewErrorMessage)]) {
            [self.delegate clickContentViewErrorMessage];
        }
    }
}

- (void)successfulCustomsClearance{
    if ([self.delegate respondsToSelector:@selector(clickContentSuccessfulCustomsClearance)]) {
        [self.delegate clickContentSuccessfulCustomsClearance];
    }
}

#pragma mark  ---- lazy

- (NSArray*)bgArray{
    if (!_bgArray) {
        _bgArray = @[@"bg_level_blue.png",@"bg_level_green.png",@"bg_level_purple.png",@"bg_level_red.png",@"bg_level_yellow"];
    }
    return _bgArray;
}

- (NSArray*)colorArray{
    return @[@"pc_panel_blue",@"pc_panel_green",@"pc_panel_purple",@"pc_panel_red",@"pc_panel_yellow"];
}

- (NSArray*)cententBgColor{
    return @[@"bg_panel_blue",@"bg_panel_green",@"bg_panel_purple",@"bg_panel_red",@"bg_panel_yellow"];
}

- (HeardView*)heardView{
    if (!_heardView) {
        _heardView = [HeardView new];
        [_heardView countdown];
    }
    return _heardView;
}

- (ContentView*)ctnView{
    if (!_ctnView) {
        _ctnView = [[ContentView alloc]initWithFrame:CGRectMake(50, XB_ScreenSize.height * 0.22, XB_ScreenSize.width - 100, XB_ScreenSize.width - 100)];
        _ctnView.delegate = self;
    }
    return _ctnView;
}

- (DidView*)didView{
    if (!_didView) {
        _didView = [[DidView alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.ctnView.frame) + 20, XB_ScreenSize.width - 60, 40)];
    }
    return _didView;
}

@end
