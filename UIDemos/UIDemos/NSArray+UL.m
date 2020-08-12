//
//  NSArray+UL.m
//  UXLive
//
//  Created by Jokan on 16/8/6.
//  Copyright © 2016年 UXIN CO. All rights reserved.
//

#import "NSArray+UL.h"

@implementation NSArray (UL)

- (NSString *)string {
    if (self == nil) {
        return @"";
    }
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (BOOL)isArrayEqual:(NSArray *)arr {
    NSMutableSet *set1 = [NSMutableSet setWithArray:arr];
    NSMutableSet *set2 = [NSMutableSet setWithArray:self];
    
    [set1 intersectSet:set2];  //取交集后 set1中为1
    
    if (set1.count == arr.count && set1.count == self.count) {
        return YES;
    }
    
    return NO;
}

- (id)ul_safeObjectAtIndex:(NSUInteger)index {
    if ([self isKindOfClass:NSArray.class] && index < self.count) {
        return [self objectAtIndex:index];
    } else {
        return nil;
    }
}

@end
