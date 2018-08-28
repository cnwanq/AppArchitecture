//
//  MVVMLoginView.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVVMLoginView.h"
#import <Masonry/Masonry.h>

@interface MVVMLoginView ()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation MVVMLoginView

- (void)dealloc
{
    [self.userVM removeObserver:self forKeyPath:@"username"];
    [self.userVM removeObserver:self forKeyPath:@"password"];
}

- (instancetype)init {
    self = [super init];
    [self installViews];
    return self;
}

- (void)installViews {
    self.usernameTextField = [UITextField new];
    self.usernameTextField.placeholder = @"Username";
    self.usernameTextField.borderStyle = UITextBorderStyleLine;
    [self.usernameTextField addTarget:self action:@selector(changeUsername:) forControlEvents:UIControlEventEditingChanged];
    self.passwordTextField = [UITextField new];
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.borderStyle = UITextBorderStyleLine;
    [self.passwordTextField addTarget:self action:@selector(changePasswrod:) forControlEvents:UIControlEventEditingChanged];
    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(tapLoginButton) forControlEvents:UIControlEventTouchUpInside];
    self.statusLabel = [UILabel new];
    
    [self addSubview:self.usernameTextField];
    [self addSubview:self.passwordTextField];
    [self addSubview:self.loginButton];
    [self addSubview:self.statusLabel];
    
    [self.usernameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(44);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.usernameTextField.mas_bottom).with.offset(8);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(44);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(44);
    }];
    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.loginButton.mas_bottom).with.offset(16);
        make.left.mas_equalTo(self).with.offset(16);
        make.right.mas_equalTo(self).with.offset(-16);
        make.height.mas_equalTo(44);
        make.bottom.mas_equalTo(self);
    }];
}

- (void)changeUsername:(UITextField *)textField
{
    self.userVM.username = textField.text;
}

- (void)changePasswrod:(UITextField *)textField
{
    self.userVM.password = textField.text;
}

- (void)tapLoginButton
{
    //
    BOOL isLogin = [self.userVM login];
    if (isLogin) {
        self.statusLabel.text = @"登录成功";
        self.statusLabel.textColor = [UIColor greenColor];
    } else {
        self.statusLabel.text = @"登录失败";
        self.statusLabel.textColor = [UIColor redColor];
    }
    if (self.statusLabel.hidden) {
        self.statusLabel.hidden = NO;
    }
}


- (void)checkUserVM:(MVVMUserVM *)userVM
{
    NSString *status = [userVM verify];
    BOOL enable = NO;
    if (status.length == 0) {
        enable = YES;
        if (!self.statusLabel.hidden) {
            self.statusLabel.hidden = YES;
        }
    } else {
        self.statusLabel.text = status;
        self.statusLabel.textColor = [UIColor redColor];
        if (self.statusLabel.hidden) {
            self.statusLabel.hidden = NO;
        }
    }
    if (enable != self.loginButton.enabled) {
        self.loginButton.enabled = enable;
        if (self.loginButton.enabled) {
            [self.loginButton setBackgroundColor:self.loginButton.tintColor];
        } else {
            [self.loginButton setBackgroundColor:[UIColor grayColor]];
        }
    }
}

#pragma mark - KVO

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"username"] || [keyPath isEqualToString:@"password"]) {
        [self checkUserVM:self.userVM];
    }
}


#pragma mark - Getter/Setter

- (void)setUserVM:(MVVMUserVM *)userVM
{
    _userVM = userVM;
    [self checkUserVM:userVM];
    [_userVM addObserver:self forKeyPath:@"username" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    [_userVM addObserver:self forKeyPath:@"password" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
}

@end
