//
//  NSString+CZHExtension.h
//  设置页面快速创建
//
//  Created by 程召华 on 2017/12/23.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (CZHExtension)
/**传入最大高度*/
- (CGSize)sizeWithFont:(UIFont *)font maxH:(CGFloat)maxH;
/**传入最大宽度*/
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;

- (CGSize)sizeWithFont:(UIFont *)font;
@end
