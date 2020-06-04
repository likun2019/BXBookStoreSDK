//
//  BXNovelManager.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BXEntraceMaterilsModel.h"

@protocol BookStoreDelegate <NSObject>

@optional
/// 登录按钮点击事件 这里三方用户重新登录后获取用户id
- (void)bookStoreViewLogin;

/// 书城视图滑动事件,(三方自己计时)
- (void)bookStoreViewBeginScroll;
@end

@interface BXNovelManager : NSObject

+(instancetype)defaultManager;

/// 书城代理方法
@property (nonatomic,weak) id<BookStoreDelegate> delegate;

/// 设置书城用户id
/// @param userId 用户id
- (void)setBookStoreUserId:(NSString *)userId;
/// 设置平台appkey
/// @param appkey 平台的appKey
/// @param secretKey 平台的appSecret
- (void)setAppKey:(NSString *)appkey
        secretKey:(NSString *)secretKey;

/// present方式打开书城首页 主要应用场景: 全屏显示
/// @param thirdUserId  三方用户唯一标示
/// @param rootController 当前控制器
- (void)presentBookStoreWtihUserId:(NSString *)thirdUserId rootController:(UIViewController *)rootController;


/// 获取小说容器视图 主要应用场景: tab栏嵌入小说书城
/// @param frame 视图frame
/// @param thirdUserId 三方用户唯一标示
- (UIView *)getBookStoreViewWithFram:(CGRect)frame thirdUserId:(NSString *)thirdUserId;

/// 获取入口素材
/// @param placeId 媒体资源位入口，通过平台获取
/// @param userId 媒体用户唯一标示(选填)
/// @param materilasModel 素材请求成功
/// @param error 素材请求失败,错误码
- (void)getEntranceMaterialsWithPlacId:(NSString *)placeId
                                userId:(NSString *)userId
                               success:(void(^)(BXEntraceMaterilsModel *model))materilasModel
                                  fail:(void(^)(NSString *error))error;

/// 入口素材点击上报
- (void)entranceMaterialsClickEventTracking;

@end


