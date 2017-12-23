//
//  CZHSettingFrameModel.m
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "CZHSettingFrameModel.h"

@implementation CZHSettingFrameModel

- (void)setItem:(CZHBaseSettingItem *)item {
    _item = item;
    
    _iconImage = [UIImage imageNamed:item.imageName];
    _titleString = item.title;
    _detailString = item.detail;
   
    _titleFont = CZHGlobelNormalFont(15);
    
    
    if ([item isKindOfClass:[CZHAvatartem class]]) {
        _cellHeight = CZH_ScaleHeight(70);
    } else {
        _cellHeight = CZH_ScaleHeight(50);
    }
    
    
    if (item.haveLine) {
        CGFloat lineX = CZH_ScaleWidth(15);
        CGFloat lineY = 0;
        CGFloat lineW = ScreenWidth - lineX;
        CGFloat lineH = 0.5;
        _lineF = CGRectMake(lineX, lineY, lineW, lineH);
    } else {
        _lineF = CGRectZero;
    }
    
    CGFloat leftMargin = 0;
    
    if (item.imageName.length > 0) {
        CGFloat iconX = 0;
        CGFloat iconY = 0;
        CGFloat iconW = 0;
        CGFloat iconH = 0;
        
        if ([item isKindOfClass:[CZHFitImageItem class]]) {
            iconX = CZH_ScaleWidth(10.5);
            iconY = CZH_ScaleHeight(0);
            iconH = _cellHeight;
            iconW = _iconImage.size.width * iconH / _iconImage.size.height;
        } else {
            
            iconX = CZH_ScaleWidth(10.5);
            iconW = CZH_ScaleHeight(20);
            iconH = _cellHeight;
            iconY = 0;
        }
        
        _iconF = CGRectMake(iconX, iconY, iconW, iconH);
        
        leftMargin = CGRectGetMaxX(_iconF) + CZH_ScaleWidth(9);
        
    } else {
        
        _iconF = CGRectZero;
        
        leftMargin = CZH_ScaleWidth(16);
    }
    
    
    
    if ([item isKindOfClass:[CZHExitItem class]]) {
        _titleF = CGRectMake(0, 0, ScreenWidth, _cellHeight);
    } else {
        CGSize titleSize = [_titleString sizeWithFont:_titleFont];
        CGFloat titleX = leftMargin;
        CGFloat titleW = titleSize.width;
        CGFloat titleH = titleSize.height;
        CGFloat titleY = (_cellHeight - titleH) * 0.5;
        _titleF = CGRectMake(titleX, titleY, titleW, titleH);
    }
    
    
  
    CGFloat detailX ;
    CGFloat detailY ;
    CGFloat detailW ;
    CGFloat detailH ;
    
    if (_detailString.length) {
        if ([item isKindOfClass:[CZHArrowItem class]]) {
            detailY = 0;
            detailW = CZH_ScaleWidth(240);
            detailH = _cellHeight;
            detailX = ScreenWidth - CZH_ScaleWidth(30) - detailW;
        } else if ([item isKindOfClass:[CZHSwitchItem class]]) {
            detailY = 0;
            detailW = CZH_ScaleWidth(100);
            detailH = _cellHeight;
            detailX = CGRectGetMaxX(_titleF) + CZH_ScaleWidth(10);
        } else {
            
            detailY = 0;
            detailW = CZH_ScaleWidth(240);
            detailH = _cellHeight;
            detailX = ScreenWidth - CZH_ScaleWidth(15) - detailW;
        }
        _detailF = CGRectMake(detailX, detailY, detailW, detailH);
    } else {
        _detailF = CGRectZero;
    }
    
    
    if ([item isKindOfClass:[CZHAvatartem class]]) {
        CGFloat avatarW = CZH_ScaleHeight(50);
        CGFloat avatarH = CZH_ScaleHeight(50);
        CGFloat avatarX = ScreenWidth - CZH_ScaleWidth(30) - avatarW;
        CGFloat avatarY = (_cellHeight - avatarH) * 0.5;
        _avatarF = CGRectMake(avatarX, avatarY, avatarW, avatarH);
        
    } else {
        _avatarF = CGRectZero;
    }
    
    
    if ([item isKindOfClass:[CZHBadgeItem class]]) {
        CZHBadgeItem *badgeItem = (CZHBadgeItem *)item;
        _badgeString = badgeItem.badge;
        
        if ([_badgeString integerValue] <= 0) {
            _badgeF = CGRectZero;
        } else {
            //            CGSize badgeSize = [_badge sizeWithFont:CZHGlobelNormalFont(13)];
            
            CGFloat badgeX = CGRectGetMaxX(_titleF) + CZH_ScaleWidth(15);
            CGFloat badgeW = [_badgeString integerValue] >= 10  ? CZH_ScaleHeight(25) : CZH_ScaleWidth(16);
            CGFloat badgeH = CZH_ScaleHeight(16);
            CGFloat badgeY = (_cellHeight - badgeH) * 0.5;
            _badgeF = CGRectMake(badgeX, badgeY, badgeW, badgeH);
        }
    } else {
        _badgeString = @"";
        _badgeF = CGRectZero;
    }
    
 
    
    if ([item isKindOfClass:[CZHArrowItem class]]) {
        CGFloat arrowX = ScreenWidth - CZH_ScaleWidth(20);
        CGFloat arrowY = 0;
        CGFloat arrowW = CZH_ScaleWidth(7.5);
        CGFloat arrowH = _cellHeight;
        
        _arrowF = CGRectMake(arrowX, arrowY, arrowW, arrowH);
        
    } else {
        _arrowF = CGRectZero;
    }
    
    if ([item isKindOfClass:[CZHEditArrowItem class]]) {
        CGFloat inputY = 0;
        CGFloat inputW = CZH_ScaleWidth(240);
        CGFloat inputH = _cellHeight;
        CGFloat inputX = ScreenWidth - CZH_ScaleWidth(30) - inputW;
        
        _inputF = CGRectMake(inputX, inputY, inputW, inputH);
        
        _detailF = CGRectZero;
    } else {
        _inputF = CGRectZero;
    }
    
    if ([item isKindOfClass:[CZHSwitchItem class]]) {
        CGFloat switchW = 51;
        CGFloat switchH = 31;
        CGFloat switchX = ScreenWidth - CZH_ScaleWidth(15) - switchW;
        CGFloat switchY = (_cellHeight - switchH) * 0.5;
        _switchF = CGRectMake(switchX, switchY, switchW, switchH);
    } else {
        _switchF = CGRectZero;
    }
}

@end
