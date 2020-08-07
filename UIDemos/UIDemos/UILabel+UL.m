//
//  UILabel+UL.m
//  UXLive
//
//  Created by leo.li on 16/7/15.
//  Copyright © 2016年 UXIN CO. All rights reserved.
//

#import "UILabel+UL.h"
#import "UIColor+UL.h"

@implementation UILabel (UL)

+ (instancetype)labelWithText:(NSString *)text {
    return [self labelWithText:text fontSize:16];
}

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)size {
    return [self labelWithText:text fontSize:size textColor:[[UIColor alloc] initWithWhite:0.0 alpha:1.0]];
}

+ (instancetype)labelWithFontSize:(CGFloat)size {
    return [self labelWithFontSize:size textColor:[[UIColor alloc] initWithWhite:0.0 alpha:1.0]];
}

+ (instancetype)labelWithFontSize:(CGFloat)size textColor:(UIColor *)textColor {
    return [self labelWithText:nil fontSize:size textColor:textColor];
}

+ (instancetype)labelWithText:(NSString *)text fontSize:(CGFloat)size textColor:(UIColor *)textColor {
    UILabel *label = [[[self class] alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:size];
    label.textColor = textColor;
    return label;
}

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    if (labelText == nil) {
        labelText = @"";
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    label.lineBreakMode = NSLineBreakByTruncatingTail;
}

@end
