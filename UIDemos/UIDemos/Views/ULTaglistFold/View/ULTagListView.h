//
//  ULTagListView.h
//  KilaNovel
//
//  Created by uxin on 2020/7/21.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ULTagListViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@class ULTagListView;
@protocol ULTagListViewDelegate <NSObject>

@optional

/// 单个tag 大小
/// @param tagListView
/// @param index
- (CGSize)tagListView:(ULTagListView *)tagListView sizeForIndex:(NSInteger)index;

/// 选中tag
/// @param tagListView
/// @param index
- (void)tagListView:(ULTagListView *)tagListView didSelectedItemForIndex:(NSInteger)index;

/// 点击折叠按钮
/// @param tagListView
/// @param sender
- (void)tagListView:(ULTagListView *)tagListView didClickFoldButton:(UIButton *)sender;

@end

@protocol ULTagListViewDataSource <NSObject>

@required

/// 返回 tags 数量
/// @param tagListView
- (NSInteger)numberOfItemsInTagListView:(ULTagListView *)tagListView;

/// 提供 tag 外部赋值
/// @param tagListView
/// @param index
- (void)tagListView:(ULTagListView *)tagListView willDisplayTagView:(UIView *)tagView index:(NSInteger)index;

- (BOOL)foldStateForTagListView:(ULTagListView *)tagListView;

@end

@interface ULTagListView : UIView

@property (nonatomic, weak) id<ULTagListViewDelegate> delegate;
@property (nonatomic, weak) id<ULTagListViewDataSource> dataSource;

/// 折叠状态
@property (nonatomic, assign) BOOL enableFold;

/// 第几行折叠
@property (nonatomic, assign) NSInteger numbersOfFoldLines;

/// 内边距
@property (nonatomic, assign) UIEdgeInsets contentInset;

/// 行间距
@property (nonatomic, assign) NSInteger lineSpacing;

/// 列间距
@property (nonatomic, assign) NSInteger columnSpacing;

- (void)reloadData;

/// 元素类注册
/// @param cellClass
- (void)registerClass:(Class)cellClass;


/// 根据下标获取单个元素
/// @param index 
- (UIView *)viewForIndex:(NSInteger)index;
+ (CGFloat)heightForTags:(NSArray *)tags foldState:(BOOL)enbaleFold numbersOfFoldLines:(NSInteger)lines contentInset:(UIEdgeInsets)contentInset lineSpacing:(NSInteger)lineSpacing columnSpacing:(NSInteger)columnSpacing maxWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
