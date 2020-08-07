//
//  GridViewController.m
//  YFDemos
//
//  Created by uxin on 2020/7/16.
//  Copyright © 2020 uxin. All rights reserved.
//

#import "GridViewController.h"
#import "GridTableViewCell.h"

@interface GridViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy) NSArray *datas;

@end

@implementation GridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    [tableView registerClass:GridTableViewCell.class forCellReuseIdentifier:@"GridTableViewCell"];
}

- (void)configData {
    
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    GridTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GridTableViewCell" forIndexPath:indexPath];
    [cell update:indexPath.row+1];
    return  cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger count = indexPath.row+1;
    return [GridTableViewCell getHeight:count];
}

@end
