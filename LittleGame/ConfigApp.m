//
//  ConfigApp.m
//  LittleGame
//
//  Created by MLive on 2018/12/18.
//  Copyright © 2018 wewq. All rights reserved.
//

#import "ConfigApp.h"
// 屏幕高度
#define SCREEN_HEIGHT         [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH          [[UIScreen mainScreen] bounds].size.width
#define IPHONEX    (SCREEN_HEIGHT >= 812 && SCREEN_WIDTH >= 375)

@implementation ConfigApp
+ (BOOL)isNotchScreen {
    if (IPHONEX) {
        return YES;
    }
    return NO;
}

@end
