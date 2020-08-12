//
//  NSArray+UL.h
//  UXLive
//
//  Created by Jokan on 16/8/6.
//  Copyright © 2016年 UXIN CO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (UL)

- (NSString *)string;

/**
 判断两个数组元素是否相等（如果顺序不一致，但是内容一致也会认为相等）

 @param arr 对比数组
 @return 是否一致
 */
- (BOOL)isArrayEqual:(NSArray *)arr;

/**
 安全取元素的方法，先判断self是否为有效的数组，然后判断索引值是否小于数组元素数量，取出元素并返回，否则返回nil

 @param index
 @return
 */
- (id)ul_safeObjectAtIndex:(NSUInteger)index;

@end
