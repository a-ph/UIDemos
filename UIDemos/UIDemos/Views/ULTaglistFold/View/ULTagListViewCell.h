//
//  ULTagListViewCell.h
//  KilaNovel
//
//  Created by uxin on 2020/7/22.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ULTagListViewCellRowNode;

NS_ASSUME_NONNULL_BEGIN

@interface ULTagListViewCell : UIView

- (void)bindRowNode:(ULTagListViewCellRowNode *)rowNode;

- (void)bindText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
