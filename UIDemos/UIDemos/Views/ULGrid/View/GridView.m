//
//  GridView.m
//  YFDemos
//
//  Created by uxin on 2020/7/16.
//  Copyright © 2020 uxin. All rights reserved.
//

#import "GridView.h"

@interface GridView ()

@property (nonatomic, strong) NSMutableArray *itemViews;

@end

@implementation GridView

- (void)layoutSubviews {
    [super layoutSubviews];
    [self reloadData];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (void)registerClass:(Class)itemClass {
    self.itemClassString = NSStringFromClass(itemClass);
}

- (void)initConfig {
    self.itemViews = [[NSMutableArray alloc] init];
    self.numberOfColumns = 5;
}

- (void)reloadData {
    [self createItemViews];
    [self layoutItemViews];
}

- (void)createItemViews {
    NSInteger itemsCount = [self.delegate numberOfRowsInGridView:self];
    if (self.itemViews.count < itemsCount) {
        NSInteger currentCount = self.itemViews.count;
        for (NSInteger i = 0; i < itemsCount - currentCount; i++) {
            id itemView = [[NSClassFromString(self.itemClassString) alloc] init];
            [self.itemViews addObject:itemView];
            [self addSubview:itemView];
        }
    }
    for (UIView *view in self.itemViews) {
        view.hidden = YES;
    }
}

- (void)layoutItemViews {
    [self layoutItemViewsForVertical];
}

- (void)layoutItemViewsForVertical {
    NSInteger colums = self.numberOfColumns;
    NSInteger itemsCount = [self.delegate numberOfRowsInGridView:self];
    CGFloat scale = [self.delegate scaleOfHeightDividedByWidth:self];
    CGFloat width = self.frame.size.width - self.contentInsets.left - self.contentInsets.right;
    CGFloat height = 0;
    CGFloat itemWidth = (CGFloat)(width-self.columnSpacing*(colums-1))/colums;
    CGFloat itemHeight = itemWidth*scale;
    
    for (NSInteger i = 0; i < itemsCount; i++) {
        UIView *view = self.itemViews[i];
        view.frame = CGRectMake(i%colums*(itemWidth+self.columnSpacing)+self.contentInsets.left, i/colums*(itemHeight+self.lineSpacing), itemWidth, itemHeight);
        [self.delegate gridView:self willDisplayCell:view];
        view.hidden = NO;
        height = CGRectGetMaxY(view.frame);
    }
}

- (UIView *)dequeueReusableItemViewWithIdentifier:(NSString *)identifier index:(NSInteger)index {
    UIView *view = self.itemViews[index];
    return view;
}

+ (CGFloat)getHeightWithLines:(NSInteger)lines count:(NSInteger)count columnSpacing:(CGFloat)columnSpacing lineSpacing:(CGFloat)lineSpacing contentInsets:(UIEdgeInsets)contentInsets maxWidth:(CGFloat)maxWidth scale:(CGFloat)scale {
    NSInteger colums = lines;
    NSInteger itemsCount = count;
    CGFloat width = maxWidth - contentInsets.left - contentInsets.right;
    CGFloat height = 0;
    CGFloat itemWidth = (CGFloat)(width-columnSpacing*(lines-1))/colums;
    CGFloat itemHeight = itemWidth*scale;
    
    if (itemsCount%colums>0) {
        height = (itemsCount/colums+1)*(itemHeight+lineSpacing);
    } else {
        height = (itemsCount/colums)*(itemHeight+lineSpacing);
    }
    return height;
}

@end
