//
//  CZHSectionItem.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CZHSectionItem : NSObject
// 头部标题
@property (nonatomic, strong) NSString *headTitle;
// 尾部标题
@property (nonatomic, strong) NSString *footTitle;
///不设置默认0
@property (nonatomic, assign) CGFloat headHeight;
///不设置默认0
@property (nonatomic, assign) CGFloat footHeight;
// 行模型数组
@property (nonatomic, strong) NSArray *items;
@end
