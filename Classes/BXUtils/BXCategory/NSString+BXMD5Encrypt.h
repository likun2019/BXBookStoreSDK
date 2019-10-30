//
//  NSString+BXMD5Encrypt.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (BXMD5Encrypt)
// MD5加密
/*
 *由于MD5加密是不可逆的,多用来进行验证
 */
// 32位小写
-(NSString *)MD5ForLower32Bate;
// 32位大写
-(NSString *)MD5ForUpper32Bate;
// 16为大写
-(NSString *)MD5ForUpper16Bate;
// 16位小写
-(NSString *)MD5ForLower16Bate;
@end

NS_ASSUME_NONNULL_END
