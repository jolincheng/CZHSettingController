//
//  CZHSettingFrameModel.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//
#import "CZHSettingHeader.h"
#import <Foundation/Foundation.h>
#import "CZHBaseSettingItem.h"
#import "CZHSwitchItem.h"
#import "CZHBadgeItem.h"
#import "CZHArrowItem.h"
#import "CZHEditArrowItem.h"
#import "CZHAvatartem.h"
#import "CZHExitItem.h"
#import "CZHFitImageItem.h"

@interface CZHSettingFrameModel : NSObject

/**箭头*/
@property (nonatomic, assign, readonly) CGRect arrowF;
/**分割线*/
@property (nonatomic, assign, readonly) CGRect lineF;
/**图片*/
@property (nonatomic, assign, readonly) CGRect iconF;
/**详细*/
@property (nonatomic, assign, readonly) CGRect detailF;
/**标题*/
@property (nonatomic, assign, readonly) CGRect titleF;
/**消息提示*/
@property (nonatomic, assign, readonly) CGRect badgeF;
/**头像*/
@property (nonatomic, assign, readonly) CGRect avatarF;
/**开关*/
@property (nonatomic, assign, readonly) CGRect switchF;
/**输入框*/
@property (nonatomic, assign, readonly) CGRect inputF;
///高度
@property (nonatomic, assign, readonly) CGFloat cellHeight;


///title字体
@property (nonatomic, strong, readonly) UIFont *titleFont;
///图片
@property (nonatomic, strong, readonly) UIImage *iconImage;
/**详情*/
@property (nonatomic, copy, readonly) NSString *titleString;
/**详情*/
@property (nonatomic, copy, readonly) NSString *detailString;
/**消息提示*/
@property (nonatomic, copy, readonly) NSString *badgeString;
///图片
@property (nonatomic, strong, readonly) NSURL *avatarUrl;
///模型
@property (nonatomic, strong) CZHBaseSettingItem *item;

@end
