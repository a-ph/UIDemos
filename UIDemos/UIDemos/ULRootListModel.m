//
//  ULRootListModel.m
//  KilaKit
//
//  Created by fanchuan on 2020/5/12.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULRootListModel.h"

@implementation ULRootListModel

+ (instancetype)modelWithDescDesc:(NSString *)desc vcClass:(NSString *)vcClass {
    return [[ULRootListModel alloc] initWithDesc:desc vcClass:vcClass];
}

- (instancetype)initWithDesc:(NSString *)desc vcClass:(NSString *)vcClass {
    self = [super init];
    if (self) {
        _desc = desc;
        _vcClass = vcClass;
    }
    return self;
}

@end
