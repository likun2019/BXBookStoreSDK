//
//  BXNovelConfig.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

extern CGFloat bkNavigationBarHeight;
extern CGFloat bkStatusBarHeight;

extern NSString  *bHTTPRootPath;

@interface BXNovelConfig : NSObject
+(instancetype)defaultCongig;
@property (nonatomic,strong) NSString *bx_appkey;
@property (nonatomic,strong) NSString *bx_secretKey;
@property (nonatomic,strong) NSString *bx_consumerId;
/// 是否已经加载
@property (nonatomic,assign) BOOL BXBookStoreLoad;
@end
