//
//  ULHorizontalLaneView.h
//  KilaKit
//
//  Created by liuxiangfei on 2020/6/23.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ULHorizontalLaneView, ULBaseHorizontalLaneCell;

@protocol ULHorizontalLaneViewDataSource <NSObject>

@required

/// 获取cell的个数
/// @param laneView laneView
- (NSInteger)horizontalLaneViewNumberOfItems:(ULHorizontalLaneView *)laneView;

/// 获取cell的size
/// @param laneView laneView
/// @param indexPath 索引
- (CGSize)horizontalLaneView:(ULHorizontalLaneView *)laneView
      sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/// 获取cell的间距
/// @param laneView laneView
- (CGFloat)horizontalLaneViewInterspace:(ULHorizontalLaneView *)laneView;

/// 获取cell
/// @param laneView laneView
/// @param indexPath 索引
- (__kindof ULBaseHorizontalLaneCell *)horizontalLaneView:(ULHorizontalLaneView *)laneView
                                   cellForItemAtIndexPath:(NSIndexPath *)indexPath;

@optional

/// 获取内容视图的内边距
/// @param laneView laneView
- (UIEdgeInsets)horizontalLaneViewContentInset:(ULHorizontalLaneView *)laneView;

@end

@interface ULHorizontalLaneView : UIView

@property (nonatomic, weak) id<ULHorizontalLaneViewDataSource> dataSource;

/// 刷新视图内容
- (void)reloadData;

- (__kindof ULBaseHorizontalLaneCell *)horizontalLaneCellWithIndexPath:(NSIndexPath *)indexPath;

@end

