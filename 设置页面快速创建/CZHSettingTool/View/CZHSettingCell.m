//
//  CZHSettingCell.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "CZHSettingCell.h"


@interface CZHSettingCell ()<UITextFieldDelegate>
/**分割线*/
@property (nonatomic, weak) UIView *line;
/**箭头*/
@property (nonatomic, weak) UIImageView *arrowImageView;
/**头像*/
@property (nonatomic, weak) UIImageView *iconImageView;
/**标题*/
@property (nonatomic, weak) UILabel *title;
/**标题*/
@property (nonatomic, weak) UILabel *detail;
/**可读消息*/
@property (nonatomic, weak) UILabel *badgeLabel;
/**头像*/
@property (nonatomic, weak) UIImageView *avatarImageView;
/**输入框*/
@property (nonatomic, weak) UITextField *inputTF;
/**开关*/
@property (nonatomic, weak) UISwitch *switchButton;
@end

static NSString *const ID = @"CZHSettingCell";
@implementation CZHSettingCell

+ (instancetype)czh_cellWithTableView:(UITableView *)tableView {
    
    CZHSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[CZHSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self czh_setCell];
        
    }
    return self;
}

- (void)czh_setCell {
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = CZHColor(0xdfdfdf);
    [self.contentView addSubview:line];
    self.line = line;
    
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    
    UILabel *title = [[UILabel alloc] init];
    title.textColor = CZHColor(0x333333);
    [self.contentView addSubview:title];
    self.title = title;
    
    UILabel *detail = [[UILabel alloc] init];
    detail.font = CZHGlobelNormalFont(15);
    detail.textColor = CZHColor(0x666666);
    [self.contentView addSubview:detail];
    self.detail = detail;
    
    UILabel *badgeLabel = [[UILabel alloc] init];
    badgeLabel.textAlignment = NSTextAlignmentCenter;
    badgeLabel.font = CZHGlobelNormalFont(13);
    badgeLabel.textColor = CZHColor(0xffffff);
    badgeLabel.backgroundColor = CZHColor(0xf95454);
    badgeLabel.layer.cornerRadius = CZH_ScaleHeight(8);
    badgeLabel.layer.masksToBounds = YES;
    [self.contentView addSubview:badgeLabel];
    self.badgeLabel = badgeLabel;
    
    UITextField *inputTF = [[UITextField alloc] init];
    inputTF.tintColor = CZHThemeColor;
    inputTF.textAlignment = NSTextAlignmentRight;
    inputTF.textColor = CZHColor(0x333333);
    inputTF.returnKeyType = UIReturnKeyDone;
    inputTF.font = CZHGlobelNormalFont(17);
    inputTF.delegate = self;
    [self.contentView addSubview:inputTF];
    self.inputTF = inputTF;
    
    
    UIImageView *avatarImageView = [[UIImageView alloc] init];
    avatarImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:avatarImageView];
    self.avatarImageView = avatarImageView;
    
    
    UIImageView *arrowImageView = [[UIImageView alloc] init];
    arrowImageView.image = [UIImage imageNamed:@"icon_arrow"];
    arrowImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.contentView addSubview:arrowImageView];
    self.arrowImageView = arrowImageView;
    
    UISwitch *switchButton = [[UISwitch alloc] init];
    switchButton.onTintColor = CZHThemeColor;
    switchButton.tintColor = CZHColor(0xfbfbfb);
    [switchButton addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:switchButton];
    self.switchButton = switchButton;
}

- (void)setFrameModel:(CZHSettingFrameModel *)frameModel {
    _frameModel = frameModel;
    
    [self czh_setData];
}

- (void)czh_setData {
    CZHBaseSettingItem *item = _frameModel.item;
    
    self.avatarImageView.backgroundColor = [UIColor redColor];
    
    self.iconImageView.image = _frameModel.iconImage;
    
    self.title.text = _frameModel.titleString;
    self.title.font = _frameModel.titleFont;
    
    if ([item isKindOfClass:[CZHBadgeItem class]]) {
        self.badgeLabel.text = _frameModel.badgeString;
    }

    
    if (_frameModel.detailString.length) {
        self.detail.text = _frameModel.detailString;
    }
    
    if (item.canClick == YES) {
        self.userInteractionEnabled = YES;
    } else {
        self.userInteractionEnabled = NO;
    }
    
    if ([item isKindOfClass:[CZHSwitchItem class]]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.detail.textAlignment = NSTextAlignmentLeft;
        self.switchButton.hidden = NO;
        CZHSwitchItem *switchItem = (CZHSwitchItem *)item;
        self.switchButton.on = switchItem.isOn;
    } else {
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        self.detail.textAlignment = NSTextAlignmentRight;
        self.switchButton.hidden = YES;
    }
    
    if ([item isKindOfClass:[CZHEditArrowItem class]]) {
        self.inputTF.text = item.detail;
    }
    
    if ([item isKindOfClass:[CZHExitItem class]]) {
        self.title.textAlignment = NSTextAlignmentCenter;
        self.title.textColor = CZHColor(0x000000);
    } else {
        self.title.textAlignment= NSTextAlignmentLeft;
        if ([item isKindOfClass:[CZHEditArrowItem class]]) {
            self.title.textColor = CZHColor(0x999999);
        } else {
            self.title.textColor = CZHColor(0x333333);
        }
    }
    
    if ([item isKindOfClass:[CZHEditArrowItem class]]) {
        
        self.detail.textColor = CZHColor(0x333333);
        
    }else if ([item isKindOfClass:[CZHSwitchItem class]]) {
        CZHSwitchItem *switchItem = (CZHSwitchItem *)item;
        if (switchItem.isOn == YES) {
            self.detail.textColor = CZHColor(0xff0000);
        } else {
            self.detail.textColor = CZHColor(0x0000ff);
        }
    } else {
        self.detail.textColor = CZHColor(0x666666);
    }
    
}




- (void)textFieldDidEndEditing:(UITextField *)textField {

    
    if ([_frameModel.item isKindOfClass:[CZHEditArrowItem class]]) {
        CZHEditArrowItem *item = (CZHEditArrowItem *)_frameModel.item;
        if (item.editCompleteBlock) {
            item.editCompleteBlock(self.inputTF.text);
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self endEditing:YES];
    return YES;
}

- (void)switchAction:(UISwitch *)sender {
    CZHBaseSettingItem *item = _frameModel.item;
    
    if ([item isKindOfClass:[CZHSwitchItem class]]) {
        CZHSwitchItem *switchItem = (CZHSwitchItem *)item;
        if (switchItem.switchBlock) {
            switchItem.switchBlock(switchItem, _indexPath, switchItem.isOn);
        }
    }
}


- (void)czh_setFrame {
    
    self.line.frame = _frameModel.lineF;
    
    self.iconImageView.frame = _frameModel.iconF;
    
    self.title.frame = _frameModel.titleF;
    
    self.detail.frame = _frameModel.detailF;
    
    self.badgeLabel.frame = _frameModel.badgeF;
    
    self.avatarImageView.frame = _frameModel.avatarF;
    
    self.inputTF.frame = _frameModel.inputF;
    
    self.arrowImageView.frame = _frameModel.arrowF;
    
    self.switchButton.frame = _frameModel.switchF;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self czh_setFrame];
}

@end
