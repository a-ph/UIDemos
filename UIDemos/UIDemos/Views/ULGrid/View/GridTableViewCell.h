//
//  GridTableViewCell.h
//  YFDemos
//
//  Created by uxin on 2020/7/16.
//  Copyright © 2020 uxin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GridTableViewCell : UITableViewCell

- (void)update:(NSInteger)index;

+ (CGFloat)getHeight:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
