//
//  ULTagListViewCellRowNode.h
//  KilaNovel
//
//  Created by uxin on 2020/7/22.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ULTagListViewCellRowNode : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

- (instancetype)initWithString:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
