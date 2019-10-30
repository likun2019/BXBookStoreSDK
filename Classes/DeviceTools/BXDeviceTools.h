//
//  BXDeviceTools.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface BXDeviceTools : NSObject
/**
 是否越狱

 @return 是否越狱
 */
+ (BOOL)isJailBreak;
/**
 *  手机型号
 *
 *  @return e.g. iPhone
 */
+(NSString *)phoneModel;
/**
 *  手机系统版本
 *
 *  @return e.g. 8.0
 */
+(NSString *)phoneVersion;
/**
 获取ip地址
 
 @param preferIPv4 是否是ipv4
 @return ip地址
 */
+ (NSString *)getIPAddress:(BOOL)preferIPv4;
/**
 获取设备名字

 */
+ (NSString *)deviceName;
/**
 获取设备mac地址
 */
+ (NSString *)getMacAddress;
/**
 获取网络类型
 */
+ (NSString *)getNetconnType;
/**
 获取电池充电状态
 */
+ (NSString *)getBatteryState;
/**
 获取运营商
 */
+ (NSString *)getOperatorInfomation;
/**
  获取idfa
 */
+ (NSString *)getIDFA;
/**
 获取ua
 */
+ (NSString *)getUserAgent;
/**
 获取设备ppi
 */
+ (NSString *)getDevicePPI;

@end

NS_ASSUME_NONNULL_END
