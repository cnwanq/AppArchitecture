//
//  MVPPresenter.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVPLoginPresenter.h"
#import "MVPUser.h"

@interface MVPLoginPresenter () <MVPLoginViewDelegate>

@property (nonatomic, strong) MVPUser *user;

@end

@implementation MVPLoginPresenter


#pragma mark - Getter/Setter

- (MVPUser *)user
{
    if (!_user) {
        _user = [MVPUser new];
    }
    return _user;
}

#pragma mark - MVPLoginViewDelegate
//- (void)changeUsername:(NSString *)username {
//    self.user.username = username;
//}
//- (void)changePasswrod:(NSString *)password {
//    self.user.password = password;
//}
- (void)tapLoginButton {
    BOOL isLogin = [self.user isExist];
    if (isLogin) {
        [self.view showLoginSucess];
    } else {
        [self.view showLoginFailedWith:@"登录失败"];
    }
}

#pragma mark - Presenter Protocal

- (void)attachView:(UIView *)view
{
    _view = (MVPLoginView *)view;
    _view.user = self.user;
    _view.delegate = self;
    
}

- (void)detachView
{
    _view = nil;
}

@end
