//
//  MVPLoginView.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVPLoginView.h"
#import <Masonry/Masonry.h>

@interface MVPLoginView ()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation MVPLoginView

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
    
//    [self.loginButton setBackgroundColor:[UIColor grayColor]];
//    self.loginButton.enabled = NO;
}

- (void)changeUsername:(UITextField *)textField
{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(changeUsername:)]) {
//        [self.delegate changeUsername:textField.text];
//    }
    self.user.username = textField.text;
    [self chearStatus];
    [self checkUser];
}

- (void)changePasswrod:(UITextField *)textField
{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(changePasswrod:)]) {
//        [self.delegate changePasswrod:textField.text];
//    }
    self.user.password = textField.text;
    [self chearStatus];
    [self checkUser];
}

- (void)tapLoginButton
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(tapLoginButton)]) {
        [self.delegate tapLoginButton];
    }
}

- (void)chearStatus
{
    if (!self.statusLabel.hidden) {
        self.statusLabel.hidden = YES;
    }
}

- (void)showLoginSucess
{
    self.statusLabel.text = @"登录成功";
    self.statusLabel.textColor = [UIColor greenColor];
    if (self.statusLabel.hidden) {
        self.statusLabel.hidden = NO;
    }
}

- (void)showLoginFailedWith:(NSString *)msg
{
    self.statusLabel.text = msg;
    self.statusLabel.textColor = [UIColor redColor];
    if (self.statusLabel.hidden) {
        self.statusLabel.hidden = NO;
    }
}

- (void)checkUser
{
    BOOL enable = NO;
    if (self.user.username.length && self.user.password.length) {
        enable = YES;
    }
    if (self.loginButton.enabled != enable) {
        self.loginButton.enabled = enable;
        if (self.loginButton.enabled) {
            self.loginButton.backgroundColor = self.loginButton.tintColor;
        } else {
            self.loginButton.backgroundColor = [UIColor grayColor];
        }
    }
}

#pragma mark - Getter/Setter

- (void)setUser:(MVPUser *)user
{
    _user = user;
    [self checkUser];
}



@end
