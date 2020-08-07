//
//  ViewController.m
//  KilaKit
//
//  Created by LeeWong on 2020/5/6.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULKitTableViewController.h"

@interface ULKitTableViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ULKitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

- (void)setupViews {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
    ULRootListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = model.desc;;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ULRootListModel *model = [self.dataArray objectAtIndex:indexPath.row];
    ULKitBaseViewController *vc = [[NSClassFromString(model.vcClass) alloc] init];
    vc.naviTitle = model.desc;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - dataArray
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [self listData];
    }
    return _dataArray;
}

- (NSArray *)listData {
    return @[];
}

@end
