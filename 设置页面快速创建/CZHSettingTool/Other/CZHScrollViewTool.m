//
//  CZHScrollViewTool.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "CZHScrollViewTool.h"

@implementation CZHScrollViewTool

+ (void)czh_contentInsetAdjustmentBehaviorWithScrollView:(UIScrollView *)scrollView {
    if (@available(iOS 11.0, *)) {
        if ([scrollView isKindOfClass:[UITableView class]]) {
            UITableView *tableView = (UITableView *)scrollView;
            tableView.estimatedRowHeight = 0;
            tableView.estimatedSectionFooterHeight = 0.1;
            tableView.estimatedSectionHeaderHeight = 0;
        }
        scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    }
}

@end
