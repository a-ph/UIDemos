//
//  ULRollViewController.m
//  KilaKit
//
//  Created by uxin on 2020/7/31.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULRollViewController.h"
#import "ULRollingViewTableViewCell.h"

@interface ULRollViewController () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation ULRollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];

    [tableView registerClass:ULRollingViewTableViewCell.class forCellReuseIdentifier:@"ULRollingViewTableViewCell"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ULRollingViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ULRollingViewTableViewCell" forIndexPath:indexPath];
    [cell reload];
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

@end
