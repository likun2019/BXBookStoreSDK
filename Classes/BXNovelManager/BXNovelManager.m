//
//  BXNovelManager.m
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXNovelManager.h"
#import "BXNetWork.h"
#import "BXNovelConfig.h"
#import "BXDeviceTools.h"
@interface BXNovelManager ()
@property (nonatomic,strong) NSString *appkey;
@property (nonatomic,strong) NSString *secretKey;
@property (nonatomic,strong) NSString *userId;
@end

@implementation BXNovelManager

+ (instancetype)defaultManager{
    static BXNovelManager *s = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s = [[BXNovelManager alloc] init];
    });
    return s;
}

/// 设置平台的appkey
- (void)setAppKey:(NSString *)appkey
        secretKey:(NSString *)secretKey{
    
    if (appkey.length) {
        self.appkey = appkey;
        [BXNovelConfig defaultCongig].bx_appkey = appkey;
    }else{
        BLog(@"请设置appkey !!!");
        return;
    }
    
    if (secretKey.length) {
        self.secretKey = secretKey;
        [BXNovelConfig defaultCongig].bx_secretKey = secretKey;
    }else{
        BLog(@"请设置secretKey !!!");
        return;
    }
    [BXDeviceTools getUserAgent];
    [self setRootHostPath];
}

- (void)setRootHostPath{
    [BXNetWork setHTTPRootPathWithAppKey:self.appkey environment:YES];
}

- (void)setEnvironment:(BXBookStoreEnvironment)environment{
    _environment = environment;
    switch (environment) {
        case BXBookStoreEnvironmentRelease:
            [BXNetWork setHTTPRootPathWithAppKey:self.appkey environment:YES];
            break;
        case BXBookStoreEnvironmentDaily:
            [BXNetWork setHTTPRootPathWithAppKey:self.appkey environment:NO];
            break;
        default:
            break;
    }
}

@end
