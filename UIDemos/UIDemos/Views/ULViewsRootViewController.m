//
//  ULViewsRootViewController.m
//  KilaKit
//
//  Created by fanchuan on 2020/5/12.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULViewsRootViewController.h"

@interface ULViewsRootViewController ()

@end

@implementation ULViewsRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSArray *)listData {
    return @[
        [ULRootListModel modelWithDescDesc:@"登录视图" vcClass:@"ULThirdPlatformLoginViewController"],
        [ULRootListModel modelWithDescDesc:@"九宫格视图" vcClass:@"GridViewController"],
        [ULRootListModel modelWithDescDesc:@"滚动公告视图" vcClass:@"ULRollViewController"],

        [ULRootListModel modelWithDescDesc:@"折叠视图" vcClass:@"ULTagListFoldViewController"],

    ];
}


@end
