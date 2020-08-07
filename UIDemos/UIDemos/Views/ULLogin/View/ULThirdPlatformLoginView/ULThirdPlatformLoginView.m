//
//  ULThirdPlatformLoginView.m
//  UXLive
//
//  Created by 张竟巍 on 2020/2/5.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import "ULThirdPlatformLoginView.h"
#import <ULCommonBase/ULLocalized.h>
#import <ULCommonBase/ULBaseFuctions.h>
#import "ULThirdLoginModel.h"
#import "ULThirdPlatfromLoginButton.h"
#import "ULHorizontalLaneView.h"

static CGFloat kULThirdPlatformButtonHeight = 67.f;
/// 第三方登录按钮宽度
static CGFloat kULThirdPlatformButtonWidth = 44.f;
/// 第三方登录按钮显示区域距屏幕距离
static CGFloat kULThirdPlatformViewMargin = 20.f;

@interface ULThirdPlatformLoginView ()<ULHorizontalLaneViewDataSource>
/// 第三方登录按钮容器
@property (nonatomic, strong) UIView *loginButtonsWrapperView;

@property (nonatomic, strong) NSMutableArray *loginButtonArray;

@property (nonatomic, copy) NSArray *dataArray;

@property (nonatomic, weak) ULHorizontalLaneView *laneView;

@end

@implementation ULThirdPlatformLoginView

- (instancetype)initWithData:(NSArray *)dataArray {
    self = [super init];
    if (self) {
        [self setupSubViews];
        [self refreshWithDataArray:dataArray];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.backgroundColor = ULColorClear;
    // 第三方登录视图
    [self setupThirdPlatformView];
    // 其他登录方式
//    [self setupOtherLoginTypeView];
}

/// 其他登录方式
- (void)setupOtherLoginTypeView {
    UIButton *otherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [otherBtn setTitleNormalText:ULString(@"其他方式登录")];
    [otherBtn setImageNormalName:@"kl_icon_sign_arrow_other"];
    otherBtn.titleLabel.font = ULBoldFont(15);
    [otherBtn setTitleNormalColor:ULRGBAHex(@"27292B", 0.7)];
    otherBtn.showsTouchWhenHighlighted = NO;
    WS(weakSelf)
    [otherBtn addActionHandler:^(UIControl *control) {
        [weakSelf showView:control];
    }];
    [self addSubview:otherBtn];
    [otherBtn layoutButtonWithImageStyle:ButtonImageStyleRight space:5];
    [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(@-14);
    }];
}

/// 显示第三方登录View
- (void)showView:(UIControl *)control {
    // 点击隐藏移除其他方式登录
    [UIView animateWithDuration:.3 animations:^{
        control.alpha = 0;
    } completion:^(BOOL finished) {
        [control removeFromSuperview];
    }];
    // 显示第三方登录view
    [UIView animateWithDuration:.6 animations:^{
        self.loginButtonsWrapperView.alpha =1;
        [self.loginButtonsWrapperView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(-(self.ul_height - kULThirdPlatformButtonHeight));
        }];
        [self layoutIfNeeded];
    }];
    if (self.delegate && [self.delegate respondsToSelector:@selector(thirdPlatformLoginViewOtherLoginType)]) {
        [self.delegate thirdPlatformLoginViewOtherLoginType];
    }
}

- (void)refreshWithDataArray:(NSArray *)dataArray {
    self.dataArray = dataArray;
    [self.laneView reloadData];
}

/// 第三方登录view
- (void)setupThirdPlatformView {
    // 登录按钮们的父视图
    UIView *loginButtonsWrapperView = [[UIView alloc] init];
    //默认不显示
    loginButtonsWrapperView.alpha = 0;
    self.loginButtonsWrapperView = loginButtonsWrapperView;
    [self addSubview:loginButtonsWrapperView];
    [loginButtonsWrapperView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.centerX.equalTo(0);
        make.height.equalTo(kULThirdPlatformButtonHeight);
    }];
    self.loginButtonArray = [[NSMutableArray alloc] init];
    CGRect laneViewFrame = CGRectMake(kULThirdPlatformViewMargin, 0, ULMainScreenWidth - kULThirdPlatformViewMargin * 2, kULThirdPlatformButtonHeight);
    ULHorizontalLaneView *laneView = [[ULHorizontalLaneView alloc] initWithFrame:laneViewFrame];
    [self addSubview:laneView];
    self.laneView = laneView;
    self.laneView.dataSource = self;
}

- (void)thirdLoginButtonAction:(ULThirdLoginModel *)model {
    NSLog(@"%s-- xiangfei.liu did click button type %@ ",__PRETTY_FUNCTION__,@(model.type));
}

- (CGFloat)thirdLoginButtonInterspace {
    /// 屏幕宽度减去两边间距为按钮显示区域宽度
    CGFloat buttonContentWidth = ULMainScreenWidth - kULThirdPlatformViewMargin * 2;
    /// 根据按钮个数等分显示区域宽度
    CGFloat spaceWidth = (buttonContentWidth - self.dataArray.count * kULThirdPlatformButtonWidth);
    /// 计算单个按钮间距，默认间距为40；只有一个按钮时居中显示，间距不起作用
    CGFloat interspace = getDivisionValue(spaceWidth, self.dataArray.count, 40);
    if (interspace < 20) {
        interspace = 20;
    }
    return interspace;
}

#pragma mark - ULHorizontalLaneViewDataSource

- (UIEdgeInsets)horizontalLaneViewContentInset:(ULHorizontalLaneView *)laneView {
    CGFloat interspace = [self thirdLoginButtonInterspace];
    CGFloat halfInterspace = getDivisionValue(interspace, 2, 20);
    UIEdgeInsets insets = UIEdgeInsetsMake(0, halfInterspace, 0, halfInterspace);
    return insets;
}

/// 获取cell的个数
/// @param laneView laneView
- (NSInteger)horizontalLaneViewNumberOfItems:(ULHorizontalLaneView *)laneView {
    return self.dataArray.count;
}

/// 获取cell的size
/// @param laneView laneView
/// @param indexPath 索引
- (CGSize)horizontalLaneView:(ULHorizontalLaneView *)laneView
      sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize loginButtonSize = CGSizeMake(kULThirdPlatformButtonWidth, kULThirdPlatformButtonHeight);
    return loginButtonSize;
}

/// 获取cell的间距
/// @param laneView laneView
- (CGFloat)horizontalLaneViewInterspace:(ULHorizontalLaneView *)laneView {
    CGFloat interspace = [self thirdLoginButtonInterspace];
    return interspace;
}

/// 获取cell
/// @param laneView laneView
/// @param indexPath 索引
- (ULBaseHorizontalLaneCell *)horizontalLaneView:(ULHorizontalLaneView *)laneView
                          cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ULThirdPlatfromLoginButton *button = [laneView horizontalLaneCellWithIndexPath:indexPath];
    ULThirdLoginModel *model = [self.dataArray ul_safeObjectAtIndex:indexPath.item];
    if (!button) {
        button = [ULThirdPlatfromLoginButton thirdLoginButtonWithModel:model];
    }
    [button refreshButtonWithModel:model];
    return button;
}

@end
