//
//  ViewController.m
//  LittleGame
//
//  Created by dym on 16/11/7.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "ViewController.h"
#import "BottonView.h"
#import "ContinueView.h"
#import "Header.h"
#import "ConfigApp.h"


@interface ViewController ()<BottonViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarHidden = NO;
    self.view.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    [self addCententView];
   
}



-(void)clickContentViewErrorMessage:(NSString*)time{
    [self clickNextViewImageName:@"pc_end_bad" time:time];
}

//成功
- (void)clickContentSuccessfulCustomsClearance:(NSString*)time{
    [self clickNextViewImageName:@"pc_end_good" time:time];
}



- (void)clickNextViewImageName:(NSString*)imageName time:(NSString*)time{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    ContinueView *contionView = [[ContinueView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:contionView];
    __weak typeof(self) blockSelf  = self;
    [contionView setContinueViewTime:time WithImgName:imageName NextBtn:^{
        [blockSelf addCententView];
    }];
}



- (void)addCententView{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    CGRect rect = self.view.bounds;
    if ([ConfigApp isNotchScreen]) {
        rect = CGRectMake(0, 22, self.view.bounds.size.width, self.view.bounds.size.height - 42);
    }
     BottonView *cententView = [[BottonView alloc]initWithFrame:rect];
    cententView.delegate = self;
    [self.view addSubview:cententView];
}





- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
