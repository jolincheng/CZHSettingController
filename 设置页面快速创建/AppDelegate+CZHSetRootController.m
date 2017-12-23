//
//  AppDelegate+CZHSetRootController.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "AppDelegate+CZHSetRootController.h"
#import "CZHAutoChooseRootControllerTool.h"

@implementation AppDelegate (CZHSetRootController)

- (void)czh_setRootController {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [CZHAutoChooseRootControllerTool czh_autoChooseControllerToWindowWithAppdelegate:self];
    

}


@end
