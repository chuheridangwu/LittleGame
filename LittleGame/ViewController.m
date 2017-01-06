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

@interface ViewController ()<BottonViewDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
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
     BottonView *cententView = [[BottonView alloc]initWithFrame:self.view.bounds];
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
