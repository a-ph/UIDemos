//
//  UILabel+UL.h
//  UXLive
//
//  Created by leo.li on 16/7/15.
//  Copyright © 2016年 UXIN CO. All rights reserved.
//

#import <UIKit/UIKit.h>

/** label分类
 *
 */
@interface UILabel (UL)

+ (instancetype)labelWithText:(NSString *)text;

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)size;

+ (instancetype)labelWithFontSize:(CGFloat)size;

+ (instancetype)labelWithFontSize:(CGFloat)size textColor:(UIColor *)textColor;

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)size textColor:(UIColor *)textColor;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

@end
