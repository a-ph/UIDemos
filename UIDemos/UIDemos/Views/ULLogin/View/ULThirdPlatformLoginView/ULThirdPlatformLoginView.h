//
//  ULThirdPlatformLoginView.h
//  UXLive
//
//  Created by 张竟巍 on 2020/2/5.
//  Copyright © 2020 UXIN CO. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ULThirdPlatformLoginViewDelegate <NSObject>
/// 微博登录
- (void)thirdPlatformLoginViewWithSina;
/// 微信登录
- (void)thirdPlatformLoginViewWithWeChat;
/// QQ登录
- (void)thirdPlatformLoginViewWithQQ;
/// 点击其他方式登录
- (void)thirdPlatformLoginViewOtherLoginType;

/// 通过Apple登录点击
- (void)appleSignInDidClick;
@end

@interface ULThirdPlatformLoginView : UIView

@property (nonatomic, weak) id <ULThirdPlatformLoginViewDelegate> delegate;

- (instancetype)initWithData:(NSArray *)dataArray;

/// 刷新视图
/// @param dataArray 
- (void)refreshWithDataArray:(NSArray *)dataArray;

@end

NS_ASSUME_NONNULL_END
