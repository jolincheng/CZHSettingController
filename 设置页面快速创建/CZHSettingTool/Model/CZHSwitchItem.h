//
//  CZHSwitchItem.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//  开关

#import "CZHBaseSettingItem.h"

@interface CZHSwitchItem : CZHBaseSettingItem

@property (nonatomic, assign) BOOL isOn;
///回调
@property (nonatomic, copy) void (^switchBlock)(CZHSwitchItem *item, NSIndexPath *indexPath, BOOL isOn);

@end
