//
//  RollView.m
//  RollingView
//
//  Created by uxin on 2020/6/19.
//  Copyright © 2020 uxin. All rights reserved.
//

#import "ULRollView.h"

@interface ULRollView ()

@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *allItemViews;
@property (nonatomic, strong) NSMutableArray *currentItemViews;
@property (nonatomic, assign) NSInteger rows;
@property (nonatomic, assign) NSInteger itemHeight;
@property (nonatomic, assign) BOOL disableRoll;// default NO
@property (nonatomic, copy) NSString *cellClassString;

@end

@implementation ULRollView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.currentIndex = 0;
        self.currentItemViews = NSMutableArray.new;
        self.allItemViews = NSMutableArray.new;
        self.timerDutation = 2.0;
        self.rollAnimateDutation = 0.35;
        self.visibleLines = 1;
    }
    return self;
}

- (void)registerCellClass:(Class)cellClass {
    self.cellClassString = NSStringFromClass(cellClass);
}

- (void)setVisibleLines:(NSInteger)visibleLines {
    _visibleLines = MAX(1, visibleLines);
}

- (void)reloadData {
    [self closeTimer];
    [self.currentItemViews removeAllObjects];
    self.currentIndex = 0;
    self.rows = [self.delegate numberOfItemsInRollView:self];
    
    if (self.rows == 0) {
        return;
    }
    
    self.itemHeight = self.frame.size.height/self.visibleLines;
    
    NSInteger itemViewsCount = 0;
    if (self.visibleLines >= self.rows) {
        self.disableRoll = YES;
        itemViewsCount = self.rows;
    } else {
        self.disableRoll = NO;
        itemViewsCount = self.visibleLines + 1;
    }
    
    if (itemViewsCount > self.allItemViews.count) {
        NSLog(@"create 1");
        [self createItemView:(itemViewsCount-self.allItemViews.count)];
    }
    [self resetItemViewState:itemViewsCount];
}

- (void)createItemView:(NSInteger)count {
    for (NSInteger index = 0; index < count; index++) {
        UIView *view = [[NSClassFromString(self.cellClassString) alloc] init];
        view.hidden = YES;
        [self addSubview:view];
        [self.allItemViews addObject:view];
    }
}

- (void)resetItemViewState:(NSInteger)count {
    for (NSInteger i = 0; i < self.allItemViews.count; i++) {
        UIView *view = self.allItemViews[i];
        if (i < count) {
            view.hidden = NO;
            view.frame = CGRectMake(0, i*self.itemHeight, CGRectGetWidth(self.frame), self.itemHeight);
            if ([self.delegate respondsToSelector:@selector(rollView:willDisplayItemView:index:)]) {
                [self.delegate rollView:self willDisplayItemView:view index:i];
            }
            [self.currentItemViews addObject:view];
        } else {
            view.hidden = YES;
        }
    }
}

- (void)startRollTimer {
    if (self.disableTimer) {
        return;
    }
    [self openTimer];
}

- (void)openTimer {
    [self closeTimer];
    self.timer = [NSTimer timerWithTimeInterval:self.timerDutation target:self selector:@selector(roll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)closeTimer {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)roll {
    if (self.disableRoll) {
        return;
    }
    
    if (self.rows < 1) {
        return;
    }
    
    self.currentIndex++;
    if (self.currentIndex > self.rows - 1) {
        self.currentIndex = 0;
    }
    [UIView animateWithDuration:self.rollAnimateDutation animations:^{
        for (UIView *view in self.currentItemViews) {
            CGRect frame = view.frame;
            frame.origin.y -= self.itemHeight;
            view.frame = frame;
        }
    } completion:^(BOOL finished) {
        UIView *firstView = self.currentItemViews.firstObject;
        [self.currentItemViews removeObject:firstView];
        [self.currentItemViews addObject:firstView];
        CGRect frame = firstView.frame;
        frame.origin.y = self.itemHeight*self.visibleLines;
        firstView.frame = frame;
        
        NSInteger index = self.currentIndex + self.visibleLines;
        index = index%self.rows;
        
        [self.delegate rollView:self willDisplayItemView:firstView index:index];
    }];
}

- (void)setRollAnimateDutation:(NSTimeInterval)rollAnimateDutation {
    _rollAnimateDutation = MIN(rollAnimateDutation, self.timerDutation)-0.1;
}

@end
