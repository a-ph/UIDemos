//
//  ULTagListView.m
//  KilaNovel
//
//  Created by uxin on 2020/7/21.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import "ULTagListView.h"

CGFloat const ULTagListViewFoldButtonWidth = 28;

@interface ULTagListView ()

@property (nonatomic, strong) NSMutableArray *tagViews;

/// 折叠行的最后一个元素的索引
@property (nonatomic, assign) NSInteger foldIndex;
@property (nonatomic, strong) UIButton *foldButton;

/// 元素类，创建子元素视图
@property (nonatomic, assign) Class tagViewClass;
@property (nonatomic, assign) NSInteger lastLine;
/// 记录展开状态下最后一个元素view的索引
@property (nonatomic, assign) NSInteger lastIndex;

@end

@implementation ULTagListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    NSInteger itemsCount = 0;
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInTagListView:)]) {
        itemsCount = [self.dataSource numberOfItemsInTagListView:self];
    }
    if (itemsCount > 0) {
        [self reloadData];
    }
}

- (void)registerClass:(Class)cellClass {
    self.tagViewClass = cellClass;
}

- (UIView *)viewForIndex:(NSInteger)index {
    return [self.tagViews ul_safeObjectAtIndex:index];
}

- (void)config {
    self.tagViews = [[NSMutableArray alloc] init];
    self.lineSpacing = 10;
    self.columnSpacing = 10;
    self.contentInset = UIEdgeInsetsZero;
    
    [self addSubview:self.foldButton];
}

- (void)reloadData {
    [self createItemViews];
    [self layoutItemViews];
    
    [self hanleFoldState];
}

- (void)foldButtonClick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(tagListView:didClickFoldButton:)]) {
        [self.delegate tagListView:self didClickFoldButton:self.foldButton];
    }
}

- (BOOL)isHiddenFoldButton {
    if (!self.enableFold ||
        self.foldIndex < 1 ||
        self.lastLine <= self.numbersOfFoldLines) {
        return YES;
    }
    return NO;
}

- (void)hanleFoldState {
    BOOL hiddenFoldButton = [self isHiddenFoldButton];
    if (hiddenFoldButton) {
        [self noShowFoldButton];
        
        return;
    }
    
    BOOL foldState = NO;
    if ([self.dataSource respondsToSelector:@selector(foldStateForTagListView:)]) {
        foldState = [self.dataSource foldStateForTagListView:self];
    }
    
    if (foldState) {
        NSInteger itemsCount = 0;
        if ([self.dataSource respondsToSelector:@selector(numberOfItemsInTagListView:)]) {
            itemsCount = [self.dataSource numberOfItemsInTagListView:self];
        }
        
        for (NSInteger i = self.foldIndex + 1; i < itemsCount; i++) {
            UIView *tagView = [self.tagViews ul_safeObjectAtIndex:i];
            tagView.hidden = YES;
        }
        [self changeFoldButtonFrameWith:self.foldIndex];
        [self.foldButton setImage:[UIImage imageNamed:@"icon_search_middle_street_down"] forState:UIControlStateNormal];
        self.foldButton.hidden = NO;
    } else {
        [self changeFoldButtonFrameWith:self.lastIndex];
        [self.foldButton setImage:[UIImage imageNamed:@"icon_search_middle_street_up"] forState:UIControlStateNormal];
        self.foldButton.hidden = NO;
    }
}


/// 根据index索引，更新foldbutton坐标
/// @param index
- (void)changeFoldButtonFrameWith:(NSInteger)index {
    UIView *indexView = [self.tagViews ul_safeObjectAtIndex:index];
    CGPoint foldOrigin = CGPointMake(CGRectGetMaxX(indexView.frame)+self.columnSpacing, CGRectGetMinY(indexView.frame));
    CGRect foldRect = self.foldButton.frame;
    foldRect.origin = foldOrigin;
    foldRect.size = CGSizeMake(ULTagListViewFoldButtonWidth, ULTagListViewFoldButtonWidth);
    self.foldButton.frame = foldRect;
}

- (void)noShowFoldButton {
    self.foldButton.hidden = YES;
}

- (void)createItemViews {
    NSInteger itemsCount = 0;
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInTagListView:)]) {
        itemsCount = [self.dataSource numberOfItemsInTagListView:self];
    }
    if (self.tagViews.count < itemsCount) {
        NSInteger currentCount = self.tagViews.count;
        for (NSInteger i = 0; i < itemsCount - currentCount; i++) {
            id itemView = [[self.tagViewClass alloc] init];
            [self addSubview:itemView];
            [self.tagViews addObject:itemView];
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(itemViewClick:)];
            [itemView addGestureRecognizer:tap];
        }
    }
    for (UIView *itemView in self.tagViews) {
        itemView.hidden = YES;
    }
}

- (void)layoutItemViews {
    NSInteger itemsCount = 0;
    if ([self.dataSource respondsToSelector:@selector(numberOfItemsInTagListView:)]) {
        itemsCount = [self.dataSource numberOfItemsInTagListView:self];
    }
    UIEdgeInsets contentInsets = self.contentInset;
    CGFloat width = self.frame.size.width - contentInsets.left - contentInsets.right - ULTagListViewFoldButtonWidth - self.columnSpacing;
    CGFloat height = 0;
    NSInteger currentLine = 0;
    CGFloat offx = contentInsets.left;
    CGFloat offy = contentInsets.top;
    
    for (NSInteger index = 0; index < itemsCount; index++) {
        UIView *view = [self.tagViews ul_safeObjectAtIndex:index];
        view.hidden = NO;
        CGSize itemSize = CGSizeZero;
        // 获取元素大小
        if ([self.delegate respondsToSelector:@selector(tagListView:sizeForIndex:)]) {
            itemSize = [self.delegate tagListView:self sizeForIndex:index];
        }
        itemSize.width = MIN(itemSize.width, width);
        // 超过最大宽度，换行
        if (offx + itemSize.width > width) {
            currentLine ++;
            offx = contentInsets.left;
            offy += itemSize.height + self.lineSpacing;
        }
        view.frame = CGRectMake(offx, offy, itemSize.width, itemSize.height);
        offx += itemSize.width + self.columnSpacing;
        if ([self.dataSource respondsToSelector:@selector(tagListView:willDisplayTagView:index:)]) {
            [self.dataSource tagListView:self willDisplayTagView:view index:index];
        }
        height = CGRectGetMaxY(view.frame);
        
        if (currentLine == self.numbersOfFoldLines) {
            self.foldIndex = index;
        }
        self.lastLine = currentLine;
        self.lastIndex = index;
    }
}

- (UIButton *)foldButton {
    if (_foldButton == nil) {
        _foldButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _foldButton.layer.cornerRadius = 14;
        _foldButton.layer.masksToBounds = YES;
        _foldButton.backgroundColor = UIColor.redColor;
        [_foldButton setImage:[UIImage imageNamed:@"icon_search_middle_street_down"] forState:UIControlStateNormal];
        [_foldButton addTarget:self action:@selector(foldButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _foldButton.hidden = YES;
    }
    return _foldButton;
}

- (void)itemViewClick:(UITapGestureRecognizer *)tap {
    UIView *itemView = tap.view;
    NSInteger index = [self.tagViews indexOfObject:itemView];
    if ([self.delegate respondsToSelector:@selector(tagListView:didSelectedItemForIndex:)]) {
        [self.delegate tagListView:self didSelectedItemForIndex:index];
    }
}

+ (CGFloat)heightForTags:(NSArray *)tags foldState:(BOOL)foldState numbersOfFoldLines:(NSInteger)lines contentInset:(UIEdgeInsets)contentInset lineSpacing:(NSInteger)lineSpacing columnSpacing:(NSInteger)columnSpacing maxWidth:(CGFloat)maxWidth {
    NSInteger itemsCount = tags.count;
    UIEdgeInsets contentInsets = contentInset;
    CGFloat width = maxWidth - contentInsets.left - contentInsets.right - ULTagListViewFoldButtonWidth - columnSpacing;
    CGFloat height = 0;
    CGFloat itemHeight = 0;
    NSInteger currentLine = 0;
    CGFloat offx = contentInsets.left;
    CGFloat offy = contentInsets.top;
    
    for (NSInteger index = 0; index < itemsCount; index++) {
        NSValue *sizeValue = [tags ul_safeObjectAtIndex:index];
        CGSize itemSize = sizeValue.CGSizeValue;
        itemHeight = itemSize.height;
        itemSize.width = MIN(itemSize.width, width);
        // 超过最大宽度，换行
        if (offx + itemSize.width > width) {
            currentLine ++;
            offx = contentInsets.left;
            offy += itemSize.height + lineSpacing;
        }
        offx += itemSize.width + columnSpacing;
        height = offy + itemSize.height;
    }
    
    if (foldState) {
        NSInteger resLines = 0;
        if (currentLine > lines) {
            resLines = lines;
        } else {
            resLines = currentLine;
        }
        height = itemHeight*(resLines+1) + lineSpacing*resLines;
    }
    
    return height;
}

@end
