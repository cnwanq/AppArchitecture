//
//  MVVMViewController.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMLoginView.h"
#import "MVVMUser.h"
#import "MVVMUserVM.h"
#import <Masonry/Masonry.h>

@interface MVVMViewController ()

@property (nonatomic, strong) MVVMLoginView *loginView;
@property (nonatomic, strong) MVVMUser *user;
@property (nonatomic, strong) MVVMUserVM *userVM;

@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MVVM";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.userVM = [[MVVMUserVM alloc] initWithUser:self.user];
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(80);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    self.loginView.userVM = self.userVM;
}

#pragma mark - Getter/Setter

- (MVVMLoginView *)loginView
{
    if (!_loginView) {
        _loginView = [MVVMLoginView new];
    }
    return _loginView;
}

- (MVVMUser *)user
{
    if (!_user) {
        _user = [MVVMUser new];
    }
    return _user;
}

@end
