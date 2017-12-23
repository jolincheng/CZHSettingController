//
//  CZHAutoChooseRootControllerTool.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AppDelegate.h"
@interface CZHAutoChooseRootControllerTool : NSObject
/**
 *内部判断返回展示控制器
 */
+ (UIViewController *)czh_autoChooseControllerToWindowWithAppdelegate:(AppDelegate *)Appdelegate;
@end
