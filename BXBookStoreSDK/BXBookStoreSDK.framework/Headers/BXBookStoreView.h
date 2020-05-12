//
//  BXBookStoreView.h
//  BXBookStoreSDKDemo
//
//  Created by likun on 2019/10/24.
//  Copyright © 2019 BeiXiang. All rights reserved.
//  BXBookStoreToTXC

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BXBookStoreViewDelegate <NSObject>
@optional
/// 登录按钮点击代理
- (void)bookStoreLogin;
/// 页面开始滑动
- (void)scrollViewBeginScroll;
@end
   
@interface BXBookStoreView : UIView
/// 代理
@property (nonatomic,weak) id<BXBookStoreViewDelegate> delegate;
/// 媒体方用户id
@property (nonatomic,strong) NSString *userId;
@end

NS_ASSUME_NONNULL_END
