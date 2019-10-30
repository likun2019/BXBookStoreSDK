//
//  BXNovelManager.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/** 环境,测试和预发,只有内网有效,外部使用只能用线上环境 */
typedef NS_ENUM (NSInteger, BXBookStoreEnvironment) {
    /** 线上环境 */
    BXBookStoreEnvironmentRelease= 0,
    /** 测试环境 */
    BXBookStoreEnvironmentDaily
};

@interface BXNovelManager : NSObject

+(instancetype)defaultManager;

/// 系统环境 默认线上环境
@property (nonatomic,assign) BXBookStoreEnvironment environment;

/// 设置平台appkey
/// @param appkey 平台的appKey
/// @param secretKey 平台的appSecret
- (void)setAppKey:(NSString *)appkey
        secretKey:(NSString *)secretKey;


@end


