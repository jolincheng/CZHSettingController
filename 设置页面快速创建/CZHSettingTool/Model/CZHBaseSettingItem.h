//
//  CZHBaseSettingItem.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//  基类

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CZHBaseSettingItem : NSObject
//是否有分割线
@property (nonatomic, assign) BOOL haveLine;
//能否点击
@property (nonatomic, assign) BOOL canClick;
//图片
@property (nonatomic, copy) NSString *imageName;
//标题
@property (nonatomic, copy) NSString *title;
//详情
@property (nonatomic, copy) NSString *detail;
//目标控制器
@property (nonatomic, assign) Class descVc;
//点击
@property (nonatomic, copy) void(^operationBlock)(CZHBaseSettingItem *item, NSIndexPath *indexPath);

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title;

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title canClick:(BOOL)canClick;

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title canClick:(BOOL)canClick haveLine:(BOOL)haveLine;
@end
