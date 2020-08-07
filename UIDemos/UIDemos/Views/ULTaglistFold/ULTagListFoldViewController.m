//
//  ULTagListFoldViewController.m
//  KilaKit
//
//  Created by uxin on 2020/7/31.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULTagListFoldViewController.h"
#import "ULTagListViewCellRowNode.h"
#import "ULTagListView.h"

@interface ULTagListFoldViewController () <ULTagListViewDelegate, ULTagListViewDataSource>

@property (nonatomic, strong) ULTagListView *tagListView;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, assign) BOOL foldState;
@property (nonatomic, assign) CGFloat height;

@end

@implementation ULTagListFoldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.array = NSMutableArray.new;
    [self configData];
    [self setupUI];
    [self reload];
}

- (NSArray *)getData {
    return @[
        @"我是随机的111",
        @"我是随机的222222",
        @"我是随机的333333333333",
        @"我是随机的444444444444444444444",
        @"我是随机的55555555555555555555555555555",
    ];
}

- (void)configData {
    for (NSInteger index=0; index < 10; index++) {
        NSString *addTitle = [[self getData] objectAtIndex:arc4random()%5];
        ULTagListViewCellRowNode *rowNode = [[ULTagListViewCellRowNode alloc] initWithString:addTitle];
        [self.array addObject:rowNode];
    }
}

- (void)addEvent:(UIButton *)sender {
    NSString *addTitle = [[self getData] objectAtIndex:arc4random()%5];
    ULTagListViewCellRowNode *rowNode = [[ULTagListViewCellRowNode alloc] initWithString:addTitle];
    [self.array addObject:rowNode];
    [self reload];
}

- (void)reload {

    NSMutableArray *sizeArray = [[NSMutableArray alloc] init];
    for (ULTagListViewCellRowNode *rowNode in self.array) {
        CGSize size = CGSizeMake(rowNode.width, rowNode.height);
        [sizeArray addObject:[NSValue valueWithCGSize:size]];
    }

    self.height = [ULTagListView heightForTags:sizeArray foldState:self.foldState numbersOfFoldLines:3 contentInset:UIEdgeInsetsZero lineSpacing:10 columnSpacing:10 maxWidth:self.view.frame.size.width-24];

    [self.tagListView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(self.height);
    }];
    [self.tagListView reloadData];
}

- (void)setupUI {
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [addButton setTitle:@"添加一个吧" forState:UIControlStateNormal];
    [addButton setBackgroundColor:UIColor.redColor];
    [addButton addTarget:self action:@selector(addEvent:) forControlEvents:UIControlEventTouchUpInside];
    [addButton setContentEdgeInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [self.view addSubview:addButton];

    [addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(88);
    }];

    ULTagListView *tagListView = [[ULTagListView alloc] init];
    tagListView.dataSource = self;
    tagListView.delegate = self;
    tagListView.enableFold = YES;
    tagListView.numbersOfFoldLines = 1;
    [self.view addSubview:tagListView];
    self.tagListView = tagListView;

    [tagListView registerClass:ULTagListViewCell.class];

    [tagListView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(addButton.mas_bottom).offset(20);
        make.left.equalTo(12);
        make.right.equalTo(-12);
        make.height.equalTo(0);
    }];
}


#pragma mark ULTagListView Delegate

- (BOOL)foldStateForTagListView:(ULTagListView *)tagListView {
    return self.foldState;
}

- (void)tagListView:(ULTagListView *)tagListView willDisplayTagView:(UIView *)tagView index:(NSInteger)index {
    ULTagListViewCell *cell = (ULTagListViewCell *)tagView;
    [cell bindRowNode:[self.array objectAtIndex:index]];
//    [cell bindText:self.array[index]];
}

- (NSInteger)numberOfItemsInTagListView:(ULTagListView *)tagListView {
    return self.array.count;
}

- (CGSize)tagListView:(ULTagListView *)tagListView sizeForIndex:(NSInteger)index {
    ULTagListViewCellRowNode *rowNode = self.array[index];
    return CGSizeMake(rowNode.width, rowNode.height);
}

//- (void)tagListView:(ULTagListView *)tagListView didSelectedItemForIndex:(NSInteger)index {
//    if ([self.delegate respondsToSelector:@selector(searchHistoryTableViewCell:tagListView:didSelectedItemForIndex:)]) {
//        [self.delegate searchHistoryTableViewCell:self tagListView:self.tagListView didSelectedItemForIndex:index];
//    }
//}

- (void)tagListView:(ULTagListView *)tagListView didClickFoldButton:(UIButton *)sender {
    self.foldState = !self.foldState;
    [self reload];
}

@end
