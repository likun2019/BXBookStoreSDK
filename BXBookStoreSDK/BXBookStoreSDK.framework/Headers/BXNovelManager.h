//
//  BXNovelManager.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface BXNovelManager : NSObject

+(instancetype)defaultManager;

/// 设置平台appkey
/// @param appkey 平台的appKey
/// @param secretKey 平台的appSecret
- (void)setAppKey:(NSString *)appkey
        secretKey:(NSString *)secretKey;


@end


