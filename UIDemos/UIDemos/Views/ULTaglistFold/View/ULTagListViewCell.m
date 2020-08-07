//
//  ULTagListViewCell.m
//  KilaNovel
//
//  Created by uxin on 2020/7/22.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import "ULTagListViewCell.h"
#import "ULTagListViewCellRowNode.h"
#import "UILabel+UL.h"

@interface ULTagListViewCell ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ULTagListViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    UIView *contentView = [[UIView alloc] init];
    contentView.backgroundColor = UIColor.grayColor;
    contentView.layer.cornerRadius = 14;
    contentView.layer.masksToBounds = YES;
    [self addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    UILabel *label = [UILabel labelWithFontSize:13 textColor:UIColor.blackColor];
    [contentView addSubview:label];
    self.label = label;
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(contentView);
        make.width.lessThanOrEqualTo(contentView).offset(-22);
    }];
}

- (void)bindRowNode:(ULTagListViewCellRowNode *)rowNode {
    self.label.text = rowNode.title;
}

- (void)bindText:(NSString *)text {
    
}

@end
