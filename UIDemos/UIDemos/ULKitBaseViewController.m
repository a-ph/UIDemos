//
//  ULKitBaseViewController.m
//  KilaKit
//
//  Created by fanchuan on 2020/5/12.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULKitBaseViewController.h"

@interface ULKitBaseViewController ()

@end

@implementation ULKitBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.naviTitle.length > 0) {
        self.navigationItem.title = self.naviTitle;
    }
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc {
    NSLog(@"%@ dealloc",NSStringFromClass(self.class));
}

@end
