//
//  ULThirdPlatfromLoginButton.m
//  KilaKit
//
//  Created by liuxiangfei on 2020/6/23.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULThirdPlatfromLoginButton.h"
#import "ULThirdLoginModel.h"

@interface ULThirdPlatfromLoginButton()

@property (nonatomic, weak) UIButton *button;

@end

@implementation ULThirdPlatfromLoginButton

+ (instancetype)thirdLoginButtonWithModel:(ULThirdLoginModel *)model {
    ULThirdPlatfromLoginButton *button = [[ULThirdPlatfromLoginButton alloc] init];
    [button refreshButtonWithModel:model];
    return button;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews {
    UIButton *button = [[UIButton alloc] init];
    [self addSubview:button];
    self.button = button;
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    self.button.backgroundColor = ULColorClear;
    self.button.titleLabel.font = ULFont(11);
    [self.button setTitleNormalColor:ULRGBAHex(@"27292B", 0.8) highlightedColor:ULSubTextColor];
    UIImageView *recommendView = [[UIImageView alloc] init];
    [recommendView setImage:[UIImage imageNamed:@"login_recommend"]];
    [self.button addSubview:recommendView];
    [recommendView makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@26);
        make.top.equalTo(@-5);
    }];
    self.recommendView = recommendView;
    recommendView.hidden = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)refreshButtonWithModel:(ULThirdLoginModel *)model {
    [self.button setTitleNormalText:model.title];
    [self.button setImageNormalName:model.normalImageName highlightedName:model.highlightedImageName];
    self.recommendView.hidden = model.isRecommend;
    [self.button layoutButtonWithImageStyle:ButtonImageStyleTop space:model.titleImageSpace];
}

@end
