//
//  CZHSettingBaseController.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZHSettingCell.h"
#import "CZHSectionItem.h"
@interface CZHSettingBaseController : UIViewController <UITableViewDelegate, UITableViewDataSource>
///tableview
@property (nonatomic, weak) UITableView *tableView;
// 保存当前tableView有多少组,元素应该是一个groupItem
@property (nonatomic, strong) NSMutableArray *sectionGroups;
//设置view
- (void)czh_setUpView;
//创建分组
- (void)czh_setGroup;
@end
