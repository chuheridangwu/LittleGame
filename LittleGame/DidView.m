//
//  DidView.m
//  LittleGame
//
//  Created by dym on 17/1/4.
//  Copyright © 2017年 wewq. All rights reserved.
//

#import "DidView.h"

@implementation DidView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 100, self.frame.size.height)];
        imgView.image = [UIImage imageNamed:@"bg_life.png"];
        [self addSubview:imgView];
//        imgView.backgroundColor = [UIColor whiteColor];
        
        
        CGFloat margin = 10;
        CGFloat imgWidth = (imgView.frame.size.width - margin * 3) / 3;
        for (int i = 0; i < 3; i++) {
            CGFloat imgX = margin + (imgWidth) * i;
            UIImageView *liveImg = [[UIImageView alloc]initWithFrame:CGRectMake(imgX, 0, imgWidth, imgWidth)];
            liveImg.image = [UIImage imageNamed:@"pc_life.png"];
            [imgView addSubview:liveImg];
        }
        
        UIImageView *rightImgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 100, 0, 100, self.frame.size.height)];
        rightImgView.image = [UIImage imageNamed:@"pc_hero.png"];
        rightImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:rightImgView];
    }
    return self;
}

@end
