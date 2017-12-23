//
//  CZHSettingBaseController.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "CZHSettingBaseController.h"


@interface CZHSettingBaseController ()

@end

@implementation CZHSettingBaseController

- (NSMutableArray *)sectionGroups
{
    if (_sectionGroups == nil) {
        _sectionGroups = [NSMutableArray array];
    }
    return _sectionGroups;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = CZHColor(0xeeeeee);
    
    [self czh_setGroup];
    
    [self czh_setUpView];

}

- (void)czh_setGroup {
    
}

- (void)czh_setUpView {
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    [CZHScrollViewTool czh_contentInsetAdjustmentBehaviorWithScrollView:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.tableFooterView = [UIView new];
    
}

#pragma mark --- tableview代理和数据源代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CZHSectionItem *group = self.sectionGroups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZHSettingCell *cell = [CZHSettingCell czh_cellWithTableView:tableView];
    cell.indexPath = indexPath;
    CZHSectionItem *group = self.sectionGroups[indexPath.section];
    cell.frameModel = group.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ///自动取消点击
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    // 获取对应的组模型
    CZHSectionItem *group = self.sectionGroups[indexPath.section];
    
    // 获取模型
    CZHSettingFrameModel *frameModel = group.items[indexPath.row];
    
    CZHBaseSettingItem *item = frameModel.item;
    
    if (item.operationBlock) {
        item.operationBlock(item, indexPath);
    }
    
    if (item.descVc) {
        UIViewController *vc = [[item.descVc alloc] init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 获取对应的组模型
    CZHSectionItem *group = self.sectionGroups[indexPath.section];
    // 获取模型
    CZHSettingFrameModel *frameModel = group.items[indexPath.row];
    
    return frameModel.cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    CZHSectionItem *groupItems = self.sectionGroups[section];
    return groupItems.headHeight;
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CZHSectionItem *groupItems = self.sectionGroups[section];
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, groupItems.headHeight)] ;
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    CZHSectionItem *groupItems = self.sectionGroups[section];
    return groupItems.footHeight;
}

- (UIView *)tableView:(UITableView *)tableView viewForfooterInSection:(NSInteger)section {
    CZHSectionItem *groupItems = self.sectionGroups[section];
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, groupItems.footHeight)] ;
    footerView.backgroundColor = [UIColor clearColor];
    return footerView;
}

@end
