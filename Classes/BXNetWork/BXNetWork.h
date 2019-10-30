//
//  BXNetWork.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXUtilsMacro.h"

typedef void(^httpRequestSuccess)  (id response);
typedef void(^httpRequestFailed)  (id response);
@interface BXNetWork : NSObject

extern NSString *HTTPRootPath;
/// 设置域名
+ (void)setHTTPRootPathWithAppKey:(NSString *)appKey environment:(BOOL)isRelease;

/// get请求
/// @param URL 请求url
/// @param dic 请求参数
/// @param success 请求成功回调
/// @param failure 请示失败回调
+(void)GET:(NSString *)URL
parameters:(NSDictionary *)dic
   success:(httpRequestSuccess)success
   failure:(httpRequestFailed)failure;

/// post请求
/// @param URL 请求url
/// @param dic 请求参数
/// @param success 请求成功回调
/// @param failure 请示失败回调
+(void)POST:(NSString *)URL
 parameters:(NSDictionary *)dic
    success:(httpRequestSuccess)success
    failure:(httpRequestFailed)failure;
@end

