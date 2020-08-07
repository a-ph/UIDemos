//
//  ULThirdLoginModel.h
//  KilaKit
//
//  Created by liuxiangfei on 2020/6/23.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 第三方登录的视图类型
typedef NS_ENUM(NSUInteger, ULThirdLoginModelType) {
    /// 微博
    ULThirdLoginModelWeibo = 0,
    /// QQ
    ULThirdLoginModelQQ = 1,
    /// 微信
    ULThirdLoginModelWechat = 2,
    /// 苹果登录
    ULThirdLoginModelApple = 3
};

@interface ULThirdLoginModel : NSObject

@property (nonatomic, assign) ULThirdLoginModelType type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normalImageName;

@property (nonatomic, copy) NSString *highlightedImageName;

@property (nonatomic, assign) CGFloat titleImageSpace;

@property (nonatomic, assign) BOOL isRecommend;

@end

