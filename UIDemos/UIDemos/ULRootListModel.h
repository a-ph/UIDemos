//
//  ULRootListModel.h
//  KilaKit
//
//  Created by fanchuan on 2020/5/12.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ULRootListModel : NSObject
///描述
@property (nonatomic, copy) NSString *desc;
///跳转目标
@property (nonatomic, copy) NSString *vcClass;


+ (instancetype)modelWithDescDesc:(NSString *)desc vcClass:(NSString *)vcClass;

@end
