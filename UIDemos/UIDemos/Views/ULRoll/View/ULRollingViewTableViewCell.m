//
//  ULRollingViewTableViewCell.m
//  RollingView
//
//  Created by uxin on 2020/7/31.
//  Copyright © 2020 uxin. All rights reserved.
//

#import "ULRollingViewTableViewCell.h"
#import "ULRollView.h"

@interface ULRollingViewTableViewCell () <ULRollViewDelegate>

@property (nonatomic, strong) ULRollView *rollView;

@end

@implementation ULRollingViewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    ULRollView *view = [[ULRollView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, 45)];
    view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
    view.delegate = self;
    view.visibleLines = MAX(1, arc4random()%4);
    view.disableTimer = NO;
    view.timerDutation = 2;
    view.rollAnimateDutation = 0.35;
    [self.contentView addSubview:view];
    self.rollView = view;
    
    [view registerCellClass:UILabel.class];
    
//    [view reloadData];
//    [view startRollTimer];
}

- (void)reload {
    [self.rollView reloadData];
    [self.rollView startRollTimer];
}

- (NSArray *)data {
    NSMutableArray *arr = NSMutableArray.new;
    for (NSInteger i=0; i<100; i++) {
        [arr addObject:@(i).stringValue];
    }
    return arr;
}

- (NSInteger)numberOfItemsInRollView:(ULRollView *)rollView {
    return [self data].count;
}

- (void)rollView:(ULRollView *)rollView willDisplayItemView:(UIView *)itemView index:(NSInteger)index {
    UILabel *label = (UILabel *)itemView;
    label.text = [[self data] objectAtIndex:index];
}

@end
