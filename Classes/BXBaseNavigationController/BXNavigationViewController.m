//
//  BXNavigationViewController.m
//  BXNovel
//
//  Created by likun on 2019/10/21.
//  Copyright © 2019 BeiXiang. All rights reserved.
//

#import "BXNavigationViewController.h"
#import "BXNovelNaviBarView.h"
#import "BXUtilsMacro.h"
@interface BXNavigationViewController ()
@property (nonatomic,strong) BXNovelNaviBarView *naviBarView;
@end

@implementation BXNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
    [self.view addSubview:self.naviBarView];
    
    self.naviBarView.naviTitle = @"书城";
    BWeakSelf
    self.naviBarView.backBlock = ^{
        [bweakSelf dismissViewControllerAnimated:YES completion:^{
            
        }];
    };
}

- (BXNovelNaviBarView *)naviBarView{
    if (!_naviBarView) {
        _naviBarView = [[BXNovelNaviBarView alloc] init];
    }
    return _naviBarView;
}
#pragma mark - 屏幕旋转控制方法


- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (void)viewSafeAreaInsetsDidChange {
    [super viewSafeAreaInsetsDidChange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
