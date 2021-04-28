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

/// 显示媒体广告源的广告
/// @param params 广告参数
/// @param callBack 回调函数名
- (void)showAd:(NSDictionary *)params callBack:(NSString *)callBack;
@end

@interface BXNovelManager : NSObject

+(instancetype)defaultManager;

/// 书城代理方法
@property (nonatomic,weak) id<BookStoreDelegate> delegate;
/// 当前视图控制器
@property (nonatomic,strong) UIViewController *currentViewController;

/// 设置书城用户id
/// @param userId 用户id
/// @param placeId 资源位id
- (void)setBookStoreUserId:(NSString *)userId placeId:(NSString *)placeId;
/// 设置平台appkey
/// @param appkey 平台的appKey
/// @param secretKey 平台的appSecret
- (void)setAppKey:(NSString *)appkey
        secretKey:(NSString *)secretKey;

/// present方式打开书城首页 主要应用场景: 全屏显示
/// @param thirdUserId  三方用户唯一标示
/// @param placeId 资源位Id
/// @param rootController 当前控制器
- (void)presentBookStoreWtihUserId:(NSString *)thirdUserId placeId:(NSString *)placeId rootController:(UIViewController *)rootController;


/// 获取小说容器视图 主要应用场景: tab栏嵌入小说书城
/// @param frame 视图frame
/// @param thirdUserId 三方用户唯一标示
/// @param placeId 资源位Id
- (UIView *)getBookStoreViewWithFram:(CGRect)frame thirdUserId:(NSString *)thirdUserId placeId:(NSString *)placeId;

/**
 **************************************************
 
 入口素材
 
 ****************************************************
*/
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

/**
 **************************************************
 
 激励视频事件上报
 
 ****************************************************
*/

/// 激励视频加载成功
/// @param params 参数
/// @param callBack 回调
- (void)uploadVideoLoad:(NSDictionary *)params callBack:(NSString *)callBack;
/// 激励视频被点击
/// @param params 参数
/// @param callBack 回调
- (void)uploadVideoClick:(NSDictionary *)params callBack:(NSString *)callBack;
/// 激励视频播放完成
/// @param params 参数
/// @param callBack 回调
- (void)uploadVideoComplete:(NSDictionary *)params callBack:(NSString *)callBack;
/// 激励视频播放出错
/// @param params 参数
/// @param callBack 回调
- (void)uploadVideoError:(NSDictionary *)params callBack:(NSString *)callBack;
/// 激励视频点击关闭按钮
/// @param params 参数
/// @param callBack 回调
- (void)uploadVideoClose:(NSDictionary *)params callBack:(NSString *)callBack;

@end


