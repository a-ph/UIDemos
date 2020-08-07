//
//  GridView.h
//  YFDemos
//
//  Created by uxin on 2020/7/16.
//  Copyright © 2020 uxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GridView;
@protocol GridViewDelegate<NSObject>

- (void)gridView:(GridView *)gridView willDisplayCell:(UIView *)cell;
- (NSInteger)numberOfRowsInGridView:(GridView *)gridView;
- (CGFloat)scaleOfHeightDividedByWidth:(GridView *)gridView;

@end

@interface GridView : UIView

@property (nonatomic, weak) id<GridViewDelegate> delegate;
@property (nonatomic, assign) NSInteger numberOfColumns;
@property (nonatomic, assign) CGFloat columnSpacing;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) UIEdgeInsets contentInsets;
@property (nonatomic, copy) NSString *itemClassString;

- (void)registerClass:(Class)itemClass;

- (void)reloadData;

+ (CGFloat)getHeightWithLines:(NSInteger)lines count:(NSInteger)count columnSpacing:(CGFloat)columnSpacing lineSpacing:(CGFloat)lineSpacing contentInsets:(UIEdgeInsets)contentInsets maxWidth:(CGFloat)maxWidth scale:(CGFloat)scale;

@end

NS_ASSUME_NONNULL_END
