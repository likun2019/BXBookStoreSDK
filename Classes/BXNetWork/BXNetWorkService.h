//
//  BXNetWorkService.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BXNetWork.h"


typedef void(^httpResponse)(BOOL result,id data);
@interface BXNetWorkService : NSObject
/// 获取小说首页链接
+ (void)getNovelURLWithAppKey:(NSString *)appkey secretKey:(NSString *)secretKey consumerId:(NSString *)userid result:(httpResponse)responseBlock;

/// 获取外网IP地址
+ (void)getRealIPAddress:(void(^)(NSString *))ipAddress;
@end


