//
//  ULThirdPlatformLoginViewController.m
//  KilaKit
//
//  Created by liuxiangfei on 2020/6/23.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULThirdPlatformLoginViewController.h"
#import "ULThirdPlatformLoginView.h"
#import "ULThirdLoginModel.h"

@interface ULThirdPlatformLoginViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, weak) ULThirdPlatformLoginView *thirdLoginView;

@end

@implementation ULThirdPlatformLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultLoginModels];
    [self setupSubviews];
}

- (void)setupSubviews {
    [self addControlButtons];
    
    ULThirdPlatformLoginView *thirdLoginView = [[ULThirdPlatformLoginView alloc] initWithData:self.dataArray];
    [self.view addSubview:thirdLoginView];
    self.thirdLoginView = thirdLoginView;
    [thirdLoginView makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(@0);
        make.bottom.equalTo(@-30);
        make.height.equalTo(@122);
    }];
}

- (void)addControlButtons {
    WS(weakSelf)
    UIButton *minusOneButton = [[UIButton alloc] init];
    [minusOneButton setTitleNormalText:@"减一个"];
    [minusOneButton setTitleNormalColor:[UIColor blackColor]];
    minusOneButton.layer.cornerRadius = 9;
    minusOneButton.layer.masksToBounds = YES;
    minusOneButton.titleLabel.font = ULFont(15);
    [minusOneButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:minusOneButton];
    [minusOneButton addActionHandler:^(UIControl *control) {
        [weakSelf changeDataArrayCount:NO];
    }];
    [minusOneButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(60, 44));
        make.right.equalTo(weakSelf.view.centerX).offset(-20);
        make.bottom.equalTo(@-200);
    }];

    UIButton *plusOneButton = [[UIButton alloc] init];
    [plusOneButton setTitleNormalText:@"加一个"];
    plusOneButton.layer.cornerRadius = 9;
    plusOneButton.layer.masksToBounds = YES;
    plusOneButton.titleLabel.font = ULFont(15);
    [plusOneButton setTitleNormalColor:[UIColor blackColor]];
    [plusOneButton setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:plusOneButton];
    [plusOneButton makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(60, 44));
        make.left.equalTo(weakSelf.view.centerX).offset(20);
        make.bottom.equalTo(@-200);
    }];
    [plusOneButton addActionHandler:^(UIControl *control) {
        [weakSelf changeDataArrayCount:YES];
    }];
}

- (void)changeDataArrayCount:(BOOL)isAdd {
    if (isAdd) {
        ULThirdLoginModel *model = [self defaultLoginModel];
        [self.dataArray ul_addObject:model];
        [self reloadThirdLoginView];
    } else {
        if ([self.dataArray isValidArray]) {
            [self.dataArray removeLastObject];
            [self reloadThirdLoginView];
        } else {
            [ULToast showToast:@"当前已无按钮展示"];
        }
    }
}

- (void)reloadThirdLoginView {
    [self.thirdLoginView refreshWithDataArray:self.dataArray.copy];
}

- (ULThirdLoginModel *)defaultLoginModel {
    ULThirdLoginModel *QQModel = [[ULThirdLoginModel alloc] init];
    QQModel.title = @"QQ";
    QQModel.normalImageName = @"icon_login_qq_n";
    QQModel.highlightedImageName = @"icon_login_qq_n";
    QQModel.titleImageSpace = 6;
    return QQModel;
}

- (void)loadDefaultLoginModels {
    self.dataArray = [[NSMutableArray alloc] init];
    ULThirdLoginModel *weiboModel = [[ULThirdLoginModel alloc] init];
    weiboModel.title = @"微博";
    weiboModel.normalImageName = @"icon_login_weibo_n";
    weiboModel.highlightedImageName = @"icon_login_weibo_n";
    weiboModel.titleImageSpace = 10;
    [self.dataArray ul_addObject:weiboModel];

    ULThirdLoginModel *QQModel = [[ULThirdLoginModel alloc] init];
    QQModel.title = @"QQ";
    QQModel.normalImageName = @"icon_login_qq_n";
    QQModel.highlightedImageName = @"icon_login_qq_n";
    QQModel.titleImageSpace = 6;
    [self.dataArray ul_addObject:QQModel];

    ULThirdLoginModel *wechatModel = [[ULThirdLoginModel alloc] init];
    wechatModel.title = @"微信";
    wechatModel.normalImageName = @"icon_login_weixin_n";
    wechatModel.highlightedImageName = @"icon_login_weixin_n";
    wechatModel.titleImageSpace = 6;
    [self.dataArray ul_addObject:wechatModel];

    // 苹果登录
    if (@available(iOS 13.0, *)) {
        ULThirdLoginModel *appleModel = [[ULThirdLoginModel alloc] init];
        appleModel.title = @"Apple";
        appleModel.normalImageName = @"kl_icon_login_apple_n";
        appleModel.highlightedImageName = @"kl_icon_login_apple_n";
        appleModel.titleImageSpace = 6;
        [self.dataArray ul_addObject:appleModel];
    }
}

- (NSArray *)listData {
    return @[];
}

@end
