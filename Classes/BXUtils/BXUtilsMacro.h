
//
//  BXUtilsMacro.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#ifndef BXUtilsMacro_h
#define BXUtilsMacro_h

#ifdef DEBUG
#define BLog(format, ...)                  \
NSLog(@"\n😂%s [Line %d]😂\n🙈%@🙈\n\n\n---------------------------------------------\n",               \
__PRETTY_FUNCTION__, __LINE__,      \
[NSString stringWithFormat:format, ## __VA_ARGS__]);
#else
#define BLog(...)
#endif

#define BWeakSelf __weak typeof(self) bweakSelf = self;

#define bKStringFormat(format,...)  [NSString stringWithFormat:format, ## __VA_ARGS__]

#define bkScreenWidth  CGRectGetWidth([[UIScreen mainScreen] bounds])
#define bkScreenHeight CGRectGetHeight([[UIScreen mainScreen] bounds])
#define bkScreenRect   [[UIScreen mainScreen] bounds]

#define BXRGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BXRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#endif /* BXUtilsMacro_h */
