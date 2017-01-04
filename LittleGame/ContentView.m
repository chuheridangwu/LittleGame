//
//  ContentView.m
//  LittleGame
//
//  Created by dym on 16/11/10.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "ContentView.h"
#import "Header.h"

@interface ContentView ()
@property (nonatomic,strong)NSMutableArray *btns;
@property (nonatomic,strong)UIButton *seleBtn;
@property (nonatomic,assign)int index;
@end

@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.index = 1;
        self.btns = [NSMutableArray array];
        
        UIView *aView = [UIView new];
        [self addSubview:aView];
        [aView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        int  count  = 5;
        CGFloat margin = 8;
        CGFloat width = (self.frame.size.width -  (count + 1) * margin) / count;
    
        NSArray *dataArray = [self ranfomArray];
        for (int i = 0 ; i < dataArray.count; i ++) {
            CGFloat low = i  % count;
            CGFloat row = i / count;
            CGFloat X = margin + (margin + width) * row;
            CGFloat Y = margin + (margin + width) * low;
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(X,    Y, width, width )];
            [aView addSubview:btn];
            [btn setTitle:[NSString stringWithFormat:@"%@",dataArray[i]] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
          
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = width / 2;
            
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
            
            [self.btns addObject:btn];
        }
        
        NSLog(@"%@",[self ranfomArray]);
    }
    return self;
}

- (void)clickBtn:(UIButton*)btn{
   
    if (![btn.titleLabel.text isEqualToString:[NSString stringWithFormat:@"%d",self.index]]) {
         NSLog(@"%s___%d",__func__,__LINE__);
        if ([self.delegate respondsToSelector:@selector(clickErrorMessage)]) {
            [self.delegate clickErrorMessage];
        }
    }else{
         [btn setBackgroundImage:[UIImage imageNamed:@"pc_panel_r.png"] forState:UIControlStateNormal];
        
        if ([btn.titleLabel.text isEqualToString:@"25"]) { //最后一个
            if ([self.delegate respondsToSelector:@selector(successfulCustomsClearance)]) {
                [self.delegate successfulCustomsClearance];
            }
        }
         self.index++;
    }
    
   
}

- (void)setBgImg:(UIImage *)bgImg{
    for (UIButton *btn in self.btns) {
          [btn setBackgroundImage:bgImg forState:UIControlStateNormal];
    }
}


- (NSArray*)ranfomArray{
     NSMutableArray *startArray = [NSMutableArray array];
    for (int  i = 1; i < 26; i++) {
        [startArray addObject:[NSString stringWithFormat:@"%d",i]];
    }
    NSMutableArray *resultArray = [[NSMutableArray alloc]initWithCapacity:0];
    
    NSInteger m = 25;
    for (int i = 0; i < m; i++) {
        int t = arc4random()%startArray.count;
        resultArray[i] = startArray[t];
        startArray[t] = [startArray lastObject];
        [startArray removeLastObject];
    }
    return  resultArray;
}

@end
