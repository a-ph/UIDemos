//
//  ULHorizontalLaneView.m
//  KilaKit
//
//  Created by liuxiangfei on 2020/6/23.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULHorizontalLaneView.h"
#import "ULBaseHorizontalLaneCell.h"

@interface ULHorizontalLaneView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UIView *scrollContentView;

@property (nonatomic, strong) NSMutableArray *subviewArray;

@end

@implementation ULHorizontalLaneView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _subviewArray = [[NSMutableArray alloc] init];
        [self setupSubviews];
    }
    return self;
}

#pragma mark - private methods

- (void)updateScrollViewWithContentWidth:(CGFloat)width contentHeight:(CGFloat)height {
    /// 刷新scrollView contentSize和内容视图frame
       self.scrollView.contentSize = CGSizeMake(width, height);
       self.scrollContentView.frame = CGRectMake(0, 0, width, height);
       /// 判断cell宽度是否超出了self的宽度，如果超出了允许scrollView滑动，否则不允许滑动
       CGFloat laneViewWidth = CGRectGetWidth(self.frame);
       BOOL scrollEnabled = (width > laneViewWidth);
       self.scrollView.scrollEnabled = scrollEnabled;
}

- (void)setupSubviews {
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    [self.scrollView addSubview:self.scrollContentView];
}

#pragma mark - data source 方法调用

/// 获取cell间距
- (CGFloat)horizontalLaneCellInterspace {
    CGFloat interspace = 40;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(horizontalLaneViewInterspace:)]) {
        interspace = [self.dataSource horizontalLaneViewInterspace:self];
    }
    return interspace;
}

/// 获取cell个数
- (NSInteger)numberOfHorizontalLaneCell {
    NSInteger numberOfItems = 0;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(horizontalLaneViewNumberOfItems:)]) {
        numberOfItems = [self.dataSource horizontalLaneViewNumberOfItems:self];
    }
    return numberOfItems;
}

/// 获取scrollView内容视图内边距
- (UIEdgeInsets)horizontalLaneViewEdgeInsets {
    UIEdgeInsets edgeInset = UIEdgeInsetsZero;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(horizontalLaneViewContentInset:)]) {
        edgeInset = [self.dataSource horizontalLaneViewContentInset:self];
    }
    return edgeInset;
}

/// 根据indexPath获取对应的size
/// @param indexPath 索引
- (CGSize)horizontalLaneCellItemSizeWithIndexPath:(NSIndexPath *)indexPath {
    CGSize itemSize = CGSizeZero;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(horizontalLaneView:sizeForItemAtIndexPath:)]) {
        itemSize = [self.dataSource horizontalLaneView:self sizeForItemAtIndexPath:indexPath];
    }
    return itemSize;
}

/// 根据indexPath获取对应的cell
/// @param indexPath 索引
- (__kindof ULBaseHorizontalLaneCell *)loadHorizontalLaneCellWithIndexPath:(NSIndexPath *)indexPath {
    ULBaseHorizontalLaneCell *cell = nil;
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(horizontalLaneView:cellForItemAtIndexPath:)]) {
        cell = [self.dataSource horizontalLaneView:self cellForItemAtIndexPath:indexPath];
    }
    if (![self.scrollContentView.subviews containsObject:cell]) {
        [self.scrollContentView addSubview:cell];
    }
    if (![self.subviewArray containsObject:cell]) {
        [self.subviewArray ul_addObject:cell];
    }
    return cell;
}

#pragma mark - public methods

- (void)reloadData {
    /// 隐藏当前视图
    for (ULBaseHorizontalLaneCell *cell in self.subviewArray) {
        cell.hidden = YES;
    }
    /// 获取cell间距
    CGFloat interspace = [self horizontalLaneCellInterspace];
    /// 获取cell个数
    CGFloat numberOfItems = [self numberOfHorizontalLaneCell];
    /// 获取scrollView内容视图内边距
    UIEdgeInsets edgeInset = [self horizontalLaneViewEdgeInsets];
    /// 初始化内容视图宽和高
    CGFloat scrollWidth = 0;
    CGFloat scrollHeight = 0;
    if (numberOfItems > 0) {
        /// cell 的大小初始化
        CGSize itemSize = CGSizeZero;
        /// cell起点横坐标
        CGFloat originX = edgeInset.left;
        /// 根据item个数循环设置cell
        for (NSInteger index = 0; index < numberOfItems; index ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
            /// 初始化或复用当前cell
            ULBaseHorizontalLaneCell *cell = [self loadHorizontalLaneCellWithIndexPath:indexPath];
            /// 更新cell的frame
            if (cell) {
                cell.hidden = NO;
                itemSize = [self horizontalLaneCellItemSizeWithIndexPath:indexPath];
                cell.frame = CGRectMake(originX, edgeInset.top, itemSize.width, itemSize.height);
                /// 累加间距和cell宽度，如果是最后一个加上右侧内边距，用来更新scrollView的contentSize
                if (index == numberOfItems - 1) {
                    originX += itemSize.width + edgeInset.right;
                } else {
                    originX += itemSize.width + interspace;
                }
                /// 记录最大的cell高度，用来更新scrollView的contentSize
                if (itemSize.height > scrollHeight) {
                    scrollHeight = itemSize.height;
                }
            }
        }
        /// 更新内容视图宽度和高度的值
        scrollWidth = originX;
        scrollHeight += edgeInset.top + edgeInset.bottom;
    }
    [self updateScrollViewWithContentWidth:scrollWidth contentHeight:scrollHeight];
}

/// 获取cell方法，如果没有就初始化一个新的
/// @param indexPath 索引
- (__kindof ULBaseHorizontalLaneCell *)horizontalLaneCellWithIndexPath:(NSIndexPath *)indexPath {
    ULBaseHorizontalLaneCell *cell = [self.subviewArray ul_safeObjectAtIndex:indexPath.item];
    return cell;
}

#pragma mark - lazy init
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollEnabled = NO;
        [self addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIView *)scrollContentView {
    if (!_scrollContentView) {
        _scrollContentView = [[UIView alloc] init];
    }
    return _scrollContentView;
}

@end
