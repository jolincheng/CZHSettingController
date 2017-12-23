//
//  CZHBaseSettingItem.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "CZHBaseSettingItem.h"

@implementation CZHBaseSettingItem
+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title {
    return [self itemWithImageName:imageName title:title canClick:NO haveLine:NO];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title canClick:(BOOL)canClick {
    
    return [self itemWithImageName:imageName title:title canClick:canClick haveLine:NO];
}

+ (instancetype)itemWithImageName:(NSString *)imageName title:(NSString *)title canClick:(BOOL)canClick haveLine:(BOOL)haveLine {
    CZHBaseSettingItem *item = [[self alloc] init];
    item.haveLine = haveLine;
    item.imageName = imageName;
    item.title = title;
    item.canClick = canClick;
    
    return item;
}
@end
