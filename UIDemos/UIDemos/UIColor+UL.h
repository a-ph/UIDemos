//
//  UIColor+UL.h
//  UXLive
//
//  Created by leo.li on 16/6/30.
//  Copyright © 2016年 UXIN CO. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ULRGBHex(hexString) [UIColor colorWithHexString:hexString]
#define ULRGBAHex(hexString, alpha_) [UIColor colorWithHexString:(hexString) alpha:(alpha_)]

//TODO:BHZ:TEST:UGC：阿里颜色使用，后面更换，time T T
#define RGBToColor(R,G,B)  [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:1.0]
#define rgba(R,G,B,A)  [UIColor colorWithRed:(R * 1.0) / 255.0 green:(G * 1.0) / 255.0 blue:(B * 1.0) / 255.0 alpha:A]

#define ULColorBlack [[UIColor alloc] initWithWhite:0.0 alpha:1.0]
#define ULColorDarkGray [[UIColor alloc] initWithWhite:0.333 alpha:1.0]
#define ULColorLightGray [[UIColor alloc] initWithWhite:0.667 alpha:1.0]
#define ULColorWhite [[UIColor alloc] initWithWhite:1.0 alpha:1.0]
#define ULColorGray [[UIColor alloc] initWithWhite:0.5 alpha:1.0]
#define ULColorRed [[UIColor alloc] initWithRed:1.0 green:0.0 blue:0.0 alpha:1.0]
#define ULColorGreen [[UIColor alloc] initWithRed:0.0 green:1.0 blue:0.0 alpha:1.0]
#define ULColorBlue [[UIColor alloc] initWithRed:0.0 green:0.0 blue:1.0 alpha:1.0]
#define ULColorCyan [[UIColor alloc] initWithRed:0.0 green:1.0 blue:1.0 alpha:1.0]
#define ULColorYellow [[UIColor alloc] initWithRed:1.0 green:1.0 blue:0.0 alpha:1.0]
#define ULColorMagenta [[UIColor alloc] initWithRed:1.0 green:0.0 blue:1.0 alpha:1.0]
#define ULColorOrange [[UIColor alloc] initWithRed:1.0 green:0.5 blue:0.0 alpha:1.0]
#define ULColorPurple [[UIColor alloc] initWithRed:0.5 green:0.0 blue:0.5 alpha:1.0]
#define ULColorBrown [[UIColor alloc] initWithRed:0.6 green:0.4 blue:0.2 alpha:1.0]
#define ULColorClear [[UIColor alloc] initWithWhite:0.0 alpha:0.0]

/** UGC素材选择背景颜色 */
#define ULColorUGCSelectMaterial ULRGBHex(@"#1F1A1A")

/** 主字体颜色 */
#define ULMainTextColor ULRGBHex(@"#27292B")

/** 背景颜色 */
#define ULBackGroundColorED ULRGBHex(@"#EDEDED")

/** 次要字体颜色 */
#define ULSubTextColor ULRGBHex(@"#9B9B98")
/** 新加次要字体颜色 */
#define ULNewSubTextColor ULRGBHex(@"#777070")
/** 详细内容字体颜色 */
#define ULDetailTextColor ULRGBHex(@"#989A9B")
/** 浅亮次要字体颜色 */
#define ULLightSubTextColor ULRGBHex(@"BBBEC0")

/** 分割线，背景色 */
#define ULBackgroundColor ULRGBHex(@"#E9E8E8")
/** 背景色2 */
#define ULBackgroundColorF4 ULRGBHex(@"#FFFFFF")
/** 我页面header背景色 */
#define ULUserHeaderBackgroundColor ULRGBHex(@"#FFF5DF")

/** 按钮选中颜色，或者一些其他高亮颜色 timeLabel色调黄色 */
#define ULHighlightColor ULRGBHex(@"#fb5d51")

#define ULVideoBgColor ULRGBHex(@"#3F3131")

/** 按钮选中颜色，或者一些其他高亮颜色 主色调黄色点击切换颜色 **/
#define ULHighlightSelectedColor ULRGBHex(@"af4038")

/** 提示文字颜色 */
#define ULTipColor ULRGBHex(@"#B6B6AD")

/** 次级文字颜色 */
#define ULSubMainColor ULRGBHex(@"#C7C7C7")

/** 导航栏颜色 */
#define ULNavigationTitleColor ULRGBHex(@"030303")

/** cell灰色点击效果 */
#define ULSelectedCellColor ULRGBHex(@"E5E5E5")

/** 颜色灰颜色 */
#define ULLightGrayColor ULRGBHex(@"989A9B")

/** 黄色颜色文字 */
#define ULYellowTextColor ULRGBHex(@"fcb932")

/** 橙色颜色 */
#define ULOrangeNormalColor ULRGBHex(@"#FB5D51")

/** 深色的分割线 */
#define ULDarkLineColor ULRGBHex(@"B2B2B2")
/** 栏目字体颜色 */
#define ULBlackTilleColor ULRGBHex(@"3D464D")
/** 视频相关的背景颜色 */
#define ULVideoBackgroundColor ULRGBHex(@"2B2222")
/** 视频流的背景 */
#define ULVideoStreamGroundColor ULRGBHex(@"1f1a1a")
#define ULVideoNewBackgroundColor ULRGBHex(@"0E0D0D")
/** 分割线颜色 */
#define ULSeperatorBackgroundColor ULRGBHex(@"F4F4F4")
#define ULFullSeperatorBackgroundColor ULRGBHex(@"E9E8E8")

/** 等级范围1 1-9粉 */
#define ULUserLevelPinkColor ULRGBHex(@"FE879D")

/** 等级范围2 10-19黄 */
#define ULUserLevelYellowColor ULRGBHex(@"FFD321")

/** 等级范围3 20-29红 */
#define ULUserLevelRedColor ULRGBHex(@"FB5D51")

/** 等级范围4 30-39绿 */
#define ULUserLevelGreenColor ULRGBHex(@"6EE1D3")

/** 等级范围4 30-39绿 */
#define ULUserLevelGreenColor ULRGBHex(@"6EE1D3")

/** 等级范围5 橙色40-59 */
#define ULUserLevelOrangeColor ULRGBHex(@"FF9950")

/** 等级范围6 蓝色60-79 */
#define ULUserLevelBlueColor ULRGBHex(@"87B3FF")

/** 灰色底色按钮常规态，按压态 */
#define ULButtonGrayNormalColor ULRGBHex(@"F2F2F3")
#define ULButtonGrayHighlightedColor ULRGBHex(@"C1C1C2")
#define ULButtonGrayBackgroundColor ULRGBHex(@"F8F8F8")
/** 红色底色按钮常规态，按压态 */
#define ULPinkRedColor ULRGBHex(@"FF8383")
#define ULButtonRedHighlightedColor ULRGBHex(@"CC6868")

#define ULNavigationMaskViewColor ULRGBHex(@"F3F3F3")
/** ui所有的遮罩颜色 */
#define ULCoverMaskViewColor ULRGBAHex(@"000000", 0.03)
/** 金色 */
#define ULGlodenColor ULRGBHex(@"F1CE5F")
/** 银色 */
#define ULSilverColor ULRGBHex(@"BDBBBB")
/** 铜色 */
#define ULCopperyColor ULRGBHex(@"D4C2A1")
/** 蓝色 */
#define ULBlueColor ULRGBHex(@"9EBBFB")

#define ULActivityEndColor ULRGBHex(@"BBBEC0")
#define ULActivityInColor ULRGBHex(@"FF8383")
#define ULActivityNotStartColor ULRGBHex(@"#FE879D")
#define ULActivityNormalColor ULRGBHex(@"9B9898")

/** 黑色标题 */
#define ULDarkBlackTextColor ULRGBHex(@"2B2727")
/** 进度条底色 */
#define ULProgressBackgroundColor ULRGBHex(@"ECD7D7")
/** 守护团字体 */
#define ULGuardiansTextColor ULRGBHex(@"A6770E")
/** switch tintColor颜色 */
#define ULSwitchTintColor ULRGBHex(@"e4e4e4")
/** 更多按钮蓝色字体 */
#define ULMoreButtonBlueColor ULRGBHex(@"7FA6FA")

/** 内容视图背景色 */
#define ULContentBackgroundColor ULRGBHex(@"F7F7F7")

/** 群组标签辅色背景颜色 默认DEE6FF 0.5 */
#define ULGroupTagBackgroundColor(colorString,alpha) ([colorString isValidString] ? ULRGBAHex(colorString, alpha) : ULRGBAHex(@"DEE6FF", alpha))

/** 统一颜色出口
 *
 */
@interface UIColor (UL)

/**
 *  @brief 将16进制颜色字符串转成UIColor对象
 *
 *  @param hexString4Color 6进制颜色字符串， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @return 返回相应的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString4Color;

/**
 *  @brief 将16进制颜色字符串按照指定透明度转成UIColor对象
 *
 *  @param hexString4Color 16进制颜色字符串， 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *  @param alpha           颜色的透明度
 *
 *  @return 返回相应的UIColor对象
 */
+ (UIColor *)colorWithHexString:(NSString *)hexString4Color alpha:(CGFloat)alpha;

/**
 *  @brief 判断两个颜色值是否相等
 *
 *  @param color 另外的颜色
 *
 *  @return YES：相等
 */
- (BOOL)isEqualWithColor:(UIColor *)color;

@end
