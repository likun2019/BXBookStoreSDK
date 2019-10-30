//
//  BXTimer.h
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BXTimer : UIView
/**
 初始化加开始
 @param timeNum 循环时间
 @param block 循环方法
 */
- (void)startTimerWithSpace:(float)timeNum block:(void(^)(BOOL))block;


/**
 恢复
 */
- (void)resume;

/**
 暂停
 */
- (void)suspend;


/**
 关闭
 */
- (void)stopTimer;
@end

NS_ASSUME_NONNULL_END
