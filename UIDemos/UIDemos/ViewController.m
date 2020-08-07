//
//  ViewController.m
//  UIDemos
//
//  Created by cold on 2020/8/7.
//  Copyright © 2020 uxin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - dataArray
- (NSArray *)listData {
    return @[
        [ULRootListModel modelWithDescDesc:@"视图组件" vcClass:@"ULViewsRootViewController"],
        [ULRootListModel modelWithDescDesc:@"动画组件" vcClass:@"ULAnimationRootViewController"],
        [ULRootListModel modelWithDescDesc:@"工具组件" vcClass:@"ULToolsRootViewController"],
    ];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}


@end
