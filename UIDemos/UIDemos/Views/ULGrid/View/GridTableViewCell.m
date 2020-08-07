//
//  GridTableViewCell.m
//  YFDemos
//
//  Created by uxin on 2020/7/16.
//  Copyright © 2020 uxin. All rights reserved.
//

#import "GridTableViewCell.h"
#import "GridView.h"

@interface GridTableViewCell () <GridViewDelegate>

@property (nonatomic, strong) GridView *gridView;
@property (nonatomic, assign) NSInteger itemCount;

@property (nonatomic, strong) UILabel *label;

@end

@implementation GridTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.label.frame = CGRectMake(0, 0, self.frame.size.width, 20);
    self.gridView.frame = self.contentView.bounds;
    self.gridView.frame = CGRectMake(0, 20, self.frame.size.width, self.frame.size.height-20);
}

- (void)initUI {
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:titleLabel];
    self.label = titleLabel;
    
    GridView *view = [[GridView alloc] initWithFrame:self.contentView.bounds];
    view.columnSpacing = 10;
    view.lineSpacing = 10;
    view.contentInsets = UIEdgeInsetsMake(0, 12, 0, 12);
    view.delegate = self;
    [self.contentView addSubview:view];
    self.gridView = view;
    
    [view registerClass:UIView.class];
}

- (void)update:(NSInteger)index {
    self.itemCount = index;
    [self.gridView reloadData];
    
    self.label.text = [NSString stringWithFormat:@"我是第%ld个", (long)index];
}

- (void)gridView:(nonnull GridView *)gridView willDisplayCell:(nonnull UIView *)cell {
    UIView *view = cell;
    view.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1];
}

- (NSInteger)numberOfRowsInGridView:(nonnull GridView *)gridView {
    return self.itemCount;
}

- (CGFloat)scaleOfHeightDividedByWidth:(GridView *)gridView {
    return 1;
}

+ (CGFloat)getHeight:(NSInteger)index {
    return [GridView getHeightWithLines:5 count:index columnSpacing:10 lineSpacing:10 contentInsets:UIEdgeInsetsZero maxWidth:[UIScreen mainScreen].bounds.size.width scale:1]+20;
}

@end
