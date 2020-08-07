//
//  RollView.h
//  RollingView
//
//  Created by uxin on 2020/6/19.
//  Copyright © 2020 uxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ULRollView;

@protocol ULRollViewDelegate <NSObject>

- (NSInteger)numberOfItemsInRollView:(ULRollView *)rollView;

- (void)rollView:(ULRollView *)rollView willDisplayItemView:(UIView *)itemView index:(NSInteger)index;

@end

@interface ULRollView : UIView

@property (nonatomic, weak) id<ULRollViewDelegate> delegate;
@property (nonatomic, assign) NSInteger visibleLines;// must > 0, default 1.
@property (nonatomic, assign) NSTimeInterval timerDutation;// default 2.0
@property (nonatomic, assign) NSTimeInterval rollAnimateDutation;// must < timerDutation, default 0.35
@property (nonatomic, assign) BOOL disableTimer;// default NO

- (void)registerCellClass:(Class)cellClass;
- (void)reloadData;
- (void)startRollTimer;
- (void)roll;

@end

NS_ASSUME_NONNULL_END
