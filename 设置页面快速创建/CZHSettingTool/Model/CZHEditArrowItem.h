//
//  CZHEditArrowItem.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//  可编辑的

#import "CZHArrowItem.h"

@interface CZHEditArrowItem : CZHArrowItem
//输入完成回调
@property (nonatomic, copy) void(^editCompleteBlock)(NSString *inputString);

@end
