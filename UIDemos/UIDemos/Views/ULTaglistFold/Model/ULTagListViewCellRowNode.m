//
//  ULTagListViewCellRowNode.m
//  KilaNovel
//
//  Created by uxin on 2020/7/22.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import "ULTagListViewCellRowNode.h"

@implementation ULTagListViewCellRowNode

- (instancetype)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.title = string;
//        CGFloat width = [string caculateLabelSizeWithFont:ULFont(13) maxSize:CGSizeMake(ULMainScreenWidth-12*2, 28)].width;
//        self.width = width + 24;//文字左右间隙
        self.height = 28;
    }
    return self;
}

@end
