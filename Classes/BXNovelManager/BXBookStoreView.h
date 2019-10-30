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
/// 登录点击事件
- (void)bookStoreLogin;
@end
   
@interface BXBookStoreView : UIView
   /// 登录按钮点击事件代理
@property (nonatomic,weak) id<BXBookStoreViewDelegate> delegate;
@property (nonatomic,strong) NSString *userId;
@end

NS_ASSUME_NONNULL_END
