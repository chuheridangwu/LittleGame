//
//  ViewController.m
//  LittleGame
//
//  Created by dym on 16/11/7.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "ViewController.h"
#import "BottonView.h"
#import "Header.h"

@interface ViewController ()<BottonViewDelegate>
@property (nonnull,strong)BottonView *cententView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self addCententView];
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(programOver) name:@"TheEndOfTheCurrentProgramRun" object:nil];
}



//当前程序结束
- (void)programOver{
    [self addCententView];
}


- (void)addCententView{
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.cententView = [[BottonView alloc]initWithFrame:self.view.bounds];
    self.cententView.delegate = self;
    [self.view addSubview:self.cententView];
}

-(void)clickContentViewErrorMessage{
    
}

//成功
- (void)clickContentSuccessfulCustomsClearance{
    
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
