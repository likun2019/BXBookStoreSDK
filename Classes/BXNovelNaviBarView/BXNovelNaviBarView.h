//
//  BXNovelNaviBarView.h
//  BXBookStoreSDKDemo
//
//  Created by likun on 2019/10/23.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^BackBtnClick)(void);
@interface BXNovelNaviBarView : UIView

/**
 返回事件
 */
@property (nonatomic,copy) BackBtnClick backBlock;
/**
 返回按钮
 */
@property (nonatomic,strong) UIButton *backButton;
/**
 标题
 */
@property (nonatomic,strong) NSString *naviTitle;
/**
 标题label
 */
@property (nonatomic,strong) UILabel *titleLabel;
@end


