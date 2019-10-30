//
//  BXBookStoreView.m
//  BXBookStoreSDKDemo
//
//  Created by likun on 2019/10/24.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXBookStoreView.h"
#import "BXNovelWebView.h"
#import "BXNovelConfig.h"
#import "BXNetWorkService.h"
#import "BXNovelViewFailedView.h"
#import "BXTimer.h"
@interface BXBookStoreView ()
/// 小说加载视图
@property (nonatomic,strong) BXNovelWebView *novelView;
@property (nonatomic,strong) BXNovelViewFailedView *loginView;
@property (nonatomic,strong) BXTimer *timer;
@end

@implementation BXBookStoreView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        [self setView];
        [self requestNovelURL];
    }
    return self;
}
- (void)setView{
    
    [BXNovelConfig defaultCongig].bx_consumerId = @"";
     _novelView = [[BXNovelWebView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    _loginView = [[BXNovelViewFailedView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _loginView.hidden = YES;
    
    [self addSubview:self.novelView];
    [self addSubview:self.loginView];
    BWeakSelf
    self.loginView.loginBlock = ^{
        if (bweakSelf.delegate && [bweakSelf.delegate respondsToSelector:@selector(bookStoreLogin)]) {
            [bweakSelf.delegate bookStoreLogin];
        }
    };
    
    self.timer = [[BXTimer alloc] init];
    [self.timer startTimerWithSpace:1 block:^(BOOL result) {
        if (result) {
            [[NSNotificationCenter defaultCenter] postNotificationName:@"BXBookStoreTimerUpdataNoti" object:nil];
        }
    }];
    
    
}
- (void)setUserId:(NSString *)userId{
    _userId = userId;
    [BXNovelConfig defaultCongig].bx_consumerId = userId;
    [self requestNovelURL];
}
- (void)requestNovelURL{
    BWeakSelf
    if ([BXNovelConfig defaultCongig].bx_consumerId.length) {
        self.loginView.hidden = YES;
        self.novelView.hidden = NO;
        [BXNetWorkService getNovelURLWithAppKey:[BXNovelConfig defaultCongig].bx_appkey secretKey:[BXNovelConfig defaultCongig].bx_secretKey consumerId:[BXNovelConfig defaultCongig].bx_consumerId result:^(BOOL result, id data) {
            if (result) {
                NSString *url = data;
                bweakSelf.novelView.novelURL = url;
            }else{
                bweakSelf.loginView.hidden = NO;
                bweakSelf.novelView.hidden = YES;
            }
        }];
    }else{
        self.loginView.hidden = NO;
        self.novelView.hidden = YES;
    }
}

@end
