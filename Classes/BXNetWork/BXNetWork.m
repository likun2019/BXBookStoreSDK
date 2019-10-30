//
//  BXNetWork.m
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXNetWork.h"
#import "BXNovelConfig.h"
NSString *DOMAIN_DEBUG = @"http://saas-test.xiaoman2018.cn/";
NSString *DOMAIN_RELEASE = @"http://saas.himeidian.com/";

NSString *HTTPRootPath;
@implementation BXNetWork

/// 设置域名
+ (void)setHTTPRootPathWithAppKey:(NSString *)appKey environment:(BOOL)isRelease{
    
    NSString *domainURL = @"";
    if (isRelease) {
        domainURL = DOMAIN_RELEASE;
    }else{
        domainURL = DOMAIN_DEBUG;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:appKey forKey:@"appKey"];
    [BXNetWork GET:bKStringFormat(@"%@/geDomain",domainURL) parameters:dic success:^(id  _Nonnull response) {
        HTTPRootPath = response;
        bHTTPRootPath = response;
    } failure:^(id  _Nonnull response) {
        BLog(@"%@",response)
    }];
}

+(void)GET:(NSString *)URL parameters:(NSDictionary *)dic success:(httpRequestSuccess)success failure:(httpRequestFailed)failure{
    
    NSString *urlString  = HTTPRootPath.length ? bKStringFormat(@"%@%@",HTTPRootPath,URL) : URL;
    if ([URL containsString:@"http://"] || [URL containsString:@"https://"]) {
        urlString = URL;
    }
   
    urlString = [urlString stringByAppendingString:[BXNetWork getGetMethodURL:dic]];
    
    //创建配置信息
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //设置请求超时时间：5秒
    configuration.timeoutIntervalForRequest = 10;
    //创建会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration: configuration delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    //设置请求方式：GET
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-Type"];
    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Accept"];

    NSURLSessionDataTask * dataTask =[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            id responseObject = [BXNetWork handleResponseWithData:data request:request];
            success(responseObject);
        }else{
            BLog(@"%@",error);
            failure(error);
        }
    }];
    [dataTask resume];
}

+(void)POST:(NSString *)URL parameters:(NSDictionary *)dic success:(httpRequestSuccess)success failure:(httpRequestFailed)failure{
  
    NSString *urlString  = HTTPRootPath.length ? bKStringFormat(@"%@%@",HTTPRootPath,URL) : URL;
    
    if ([URL containsString:@"http://"] || [URL containsString:@"https://"]) {
           urlString = URL;
       }
    //创建配置信息
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //设置请求超时时间：5秒
    configuration.timeoutIntervalForRequest = 10;
    //创建会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration: configuration delegate: nil delegateQueue: [NSOperationQueue mainQueue]];
     NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    //设置请求方式：POST
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"content-Type"];
    [request setValue:@"application/json;charset=utf-8" forHTTPHeaderField:@"Accept"];
    
    //data的字典形式转化为data
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    //设置请求体
    [request setHTTPBody:jsonData];
    
    NSURLSessionDataTask * dataTask =[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (error == nil) {
            id responseObject = [BXNetWork handleResponseWithData:data request:request];
            success(responseObject);
        }else{
            BLog(@"%@",error);
            failure(error);
        }
    }];
    [dataTask resume];
}

/// get 请求获取拼接参数
+ (NSString *)getGetMethodURL:(NSDictionary *)dic{
    NSArray *keys = [dic allKeys];
    if (keys.count) {
        NSString *s = @"?";
        for (int i=0; i<keys.count; i++) {
            NSString *key = [keys objectAtIndex:i];
            NSString *value = [dic objectForKey:key];
            s = [s stringByAppendingString:key];
            s = [s stringByAppendingString:@"="];
            s = [s stringByAppendingString:value];
            if (i != keys.count-1) {
                s = [s stringByAppendingString:@"&"];
            }
        }
        return s;
    }
    return @"";
}

/// 处理请求结果
+ (id)handleResponseWithData:(NSData *)data request:(NSURLRequest *)request{
    NSDictionary *responseObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    if (responseObject) {
        return responseObject;
    }
    NSString * str  =[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (str) {
        if ([str containsString:@"<!DOCTYPE html>"]) {
            return request.URL.absoluteString;
        }
        return str;
    }
    return nil;
}


@end
