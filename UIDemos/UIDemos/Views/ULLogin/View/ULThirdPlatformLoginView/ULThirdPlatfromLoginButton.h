//
//  ULThirdPlatfromLoginButton.h
//  KilaKit
//
//  Created by liuxiangfei on 2020/6/23.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULBaseHorizontalLaneCell.h"

@class ULThirdLoginModel;

#define ULSubTextColor ULRGBHex(@"#9B9B98")

#define ULColorClear [[UIColor alloc] initWithWhite:0.0 alpha:0.0]

@interface ULThirdPlatfromLoginButton : ULBaseHorizontalLaneCell

@property (nonatomic, weak) UIImageView *recommendView;

+ (instancetype)thirdLoginButtonWithModel:(ULThirdLoginModel *)model;

- (void)refreshButtonWithModel:(ULThirdLoginModel *)model;

@end

