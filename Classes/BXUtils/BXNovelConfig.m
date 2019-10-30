//
//  BXNovelConfig.m
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXNovelConfig.h"
#import "BXUtilsMacro.h"

CGFloat   bkNavigationBarHeight;
CGFloat   bkStatusBarHeight;
NSString  *bHTTPRootPath;
@implementation BXNovelConfig

+ (instancetype)defaultCongig{
    static BXNovelConfig *s = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        s = [[BXNovelConfig alloc] init];
        [s screenScale];
    });
    return s;
}

- (void)screenScale {
    
    bkNavigationBarHeight  = 64;
    bkStatusBarHeight = 20;
    if (bkScreenWidth/bkScreenHeight < 0.5) {
        bkNavigationBarHeight = 88;
        bkStatusBarHeight = 44;
    }
}

@end
