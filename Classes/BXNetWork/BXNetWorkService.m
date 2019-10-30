//
//  BXNetWorkService.m
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXNetWorkService.h"
#import "BXDeviceTools.h"
#import "NSDate+BXDate.h"
#import "NSString+BXMD5Encrypt.h"
@implementation BXNetWorkService
/// 获取小说首页链接

+ (void)getNovelURLWithAppKey:(NSString *)appkey
                    secretKey:(NSString *)secretKey
                   consumerId:(NSString *)userid
                       result:(httpResponse)responseBlock{
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:1];
    [dic setValue:[BXDeviceTools getIDFA] forKey:@"deviceId"];
    [dic setValue:userid forKey:@"consumerId"];
    [dic setValue:appkey forKey:@"appKey"];
    NSString *timestamp = [NSDate getNowTimeTimestamp3];
    [dic setValue:timestamp forKey:@"timestamp"];
    NSString *sign = [BXNetWorkService md5SignWithDic:dic withSecretKey:secretKey];
    [dic setValue:sign forKey:@"sign"];
    
    [BXNetWork GET:@"/novel" parameters:dic success:^(id response) {
        if ([response isKindOfClass:[NSDictionary class]]) {
            responseBlock(NO,response);
        }else{
            responseBlock(YES,response);
        }
    } failure:^(id response) {
        responseBlock(NO,response);
    }];
}

+ (NSString *)md5SignWithDic:(NSDictionary *)dic withSecretKey:(NSString *)secretKey{
    
    NSArray *keys = [dic allKeys];
    if (keys.count) {
        NSString *s = @"appKey=";
        s = [s stringByAppendingString:[dic objectForKey:@"appKey"]];
        s = [s stringByAppendingString:bKStringFormat(@"secretKey=%@",secretKey)];
        s = [s stringByAppendingString:@"timestamp="];
        s = [s stringByAppendingString:[dic objectForKey:@"timestamp"]];
        s = [s stringByAppendingString:@"consumerId="];
        s = [s stringByAppendingString:[dic objectForKey:@"consumerId"]];
        s = [s MD5ForLower32Bate];
        return s;
    }
    return @"";
}

+ (void)getRealIPAddress:(void(^)(NSString *))ipAddress{
    [BXNetWork GET:@"http://ip.360.cn/IPShare/info" parameters:nil success:^(id response) {
        if ([response isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = response;
            if (dic != nil && dic != NULL) {
                ipAddress([dic valueForKey:@"ip"]);
            }else{
                ipAddress(@"0.0.0.0");
            }
        }else{
            ipAddress(@"0.0.0.0");
        }
    } failure:^(id response) {
        ipAddress(@"0.0.0.0");
    }];
}
@end
