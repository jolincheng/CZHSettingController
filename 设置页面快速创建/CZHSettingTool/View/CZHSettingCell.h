//
//  CZHSettingCell.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CZHSettingFrameModel.h"
@interface CZHSettingCell : UITableViewCell

///模型
@property (nonatomic, strong) CZHSettingFrameModel *frameModel;
/**下标*/
@property (nonatomic, strong) NSIndexPath *indexPath;

+ (instancetype)czh_cellWithTableView:(UITableView *)tableView;
@end
