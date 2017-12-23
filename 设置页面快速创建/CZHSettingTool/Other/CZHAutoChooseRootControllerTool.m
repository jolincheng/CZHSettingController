//
//  CZHAutoChooseRootControllerTool.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "CZHAutoChooseRootControllerTool.h"
#import "CZHSettingController.h"
#import "CZHNavigationController.h"
static NSString *const version = @"ONSVersion";
@implementation CZHAutoChooseRootControllerTool


+ (UIViewController *)czh_autoChooseControllerToWindowWithAppdelegate:(AppDelegate *)Appdelegate {
    
//    // 2.设置根控制器
//    NSString *key = @"CFBundleShortVersionString";
//    // 上一次的使用版本（存储在沙盒中的版本号）
//    NSString *oldVersion = [[NSUserDefaults standardUserDefaults] objectForKey:version];
//    // 当前软件的版本号（从Info.plist中获得）
//    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    
//    if ([currentVersion isEqualToString:oldVersion]) { // 版本号相同：这次打开和上次打开的是同一个版本
//
//
//        } else {//登陆过
//
//
//        }
//
//    } else { // 这次打开的版本和上一次不一样，显示新特性
//
//
//
//    }
    
    return [[CZHNavigationController alloc] initWithRootViewController:[[CZHSettingController alloc] init]];
    
}

@end
