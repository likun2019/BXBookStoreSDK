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

@interface BXNovelManager : NSObject

+(instancetype)defaultManager;

/// 设置平台appkey
/// @param appkey 平台的appKey
/// @param secretKey 平台的appSecret
- (void)setAppKey:(NSString *)appkey
        secretKey:(NSString *)secretKey;

/// 获取入口素材
/// @param placeId 媒体资源位入口，通过平台获取
/// @param userId 媒体用户唯一标示
/// @param materilasModel 素材请求成功
/// @param error 素材请求失败,错误码
- (void)getEntranceMaterialsWithPlacId:(NSString *)placeId
                                userId:(NSString *)userId
                               success:(void(^)(BXEntraceMaterilsModel *model))materilasModel
                                  fail:(void(^)(NSString *error))error;

/// 入口素材点击上报
- (void)entranceMaterialsClickEventTracking;

@end


