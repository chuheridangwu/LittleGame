//
//  HeardView.m
//  LittleGame
//
//  Created by dym on 16/11/7.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "HeardView.h"
#import "Header.h"

@interface HeardView ()
@property (nonatomic,strong)NSArray *iconArry;
@property (nonatomic,strong)UIButton *bgBtn;
@property (nonatomic,assign)int index;
@end

@implementation HeardView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
        NSInteger count = arc4random()%self.iconArry.count;
        imageView.image = [UIImage imageNamed:self.iconArry[count]];
        imageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(0);
            make.width.equalTo(imageView.height);
            make.bottom.equalTo(0);
        }];
        
        [self addSubview:self.bgBtn];
        [self.bgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5);
            make.right.equalTo(-30);
            make.width.equalTo(70);
            make.bottom.equalTo(-5);
        }];
        
    }
    return self;
}

- (void)countdown{
     self.index = 60;
    [self.bgBtn setTitle:[NSString stringWithFormat:@"%d",self.index] forState:UIControlStateNormal];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(downTime:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)downTime:(NSTimer*)timer{
    self.index -- ;
    if (self.index <= 0) {
        [timer invalidate];
        timer = nil;
            [[NSNotificationCenter defaultCenter] postNotificationName:@"TheEndOfTheCurrentProgramRun" object:nil];
        return;
    }
    [self.bgBtn setTitle:[NSString stringWithFormat:@"%d",self.index] forState:UIControlStateNormal];
}

- (NSArray*)iconArry{
    if (!_iconArry) {
        NSMutableArray *icon = [NSMutableArray array];
        for (int i = 1 ; i < 10; i++) {
            NSString *iconName = [NSString stringWithFormat:@"pc_enemy_%d.png",i];
            [icon addObject:iconName];
        }
        _iconArry = icon;
    }
    return _iconArry;
}

- (UIButton *)bgBtn{
    if (!_bgBtn) {
        _bgBtn = [UIButton new];
        [_bgBtn setBackgroundImage:[UIImage imageNamed:@"bg_timer.png"] forState:UIControlStateNormal];
        [_bgBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _bgBtn.userInteractionEnabled = NO;
        
    }
    return _bgBtn;
}
@end
