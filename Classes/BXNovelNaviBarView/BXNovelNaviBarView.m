//
//  BXNovelNaviBarView.m
//  BXBookStoreSDKDemo
//
//  Created by likun on 2019/10/23.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXNovelNaviBarView.h"
#import "BXUtilsMacro.h"
#import "BXNovelConfig.h"
@implementation BXNovelNaviBarView

-(instancetype)init{
    self = [super initWithFrame:CGRectMake(0, 0, bkScreenWidth, bkNavigationBarHeight)];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(10, bkStatusBarHeight, 44, 44);
        [backBtn setImage:[UIImage imageNamed:@"BXBookStoreBoundle.bundle/bx_navi_close"] forState:0];
        [backBtn setTitle:@"   " forState:0];
        [backBtn addTarget:self action:@selector(doBack) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:backBtn];
        self.backButton = backBtn;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, bkStatusBarHeight, bkScreenWidth-160, bkNavigationBarHeight- bkStatusBarHeight)];
        titleLabel.textColor = UIColor.blackColor;
        titleLabel.font = [UIFont systemFontOfSize:18];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
    }
    return self;
}
- (void)setNaviTitle:(NSString *)naviTitle{
    _naviTitle = naviTitle;
    self.titleLabel.text = naviTitle;
}

- (void)doBack{
    if (self.backBlock) {
        self.backBlock();
    }
}

@end
