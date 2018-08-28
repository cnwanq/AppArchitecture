//
//  CDDLoginView.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "CDDLoginView.h"
#import <Masonry/Masonry.h>
#import "CDDContext.h"
#import "NSObject+CDD.h"
#import "CDDLoginBusinessObject.h"
#import "CDDLoginDataHandler.h"

@interface CDDLoginView ()

@property (nonatomic, strong) UITextField *usernameTextField;
@property (nonatomic, strong) UITextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UILabel *statusLabel;

@end

@implementation CDDLoginView


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
    [self updateUserTextField];
}

- (void)changePasswrod:(UITextField *)textField
{
    [self updateUserTextField];
}

- (void)checkState
{
    [self updateUserTextField];
}

- (void)updateUserTextField
{
    CDDLoginBusinessObject *loginBO = (CDDLoginBusinessObject *)self.context.businessObject;
    [loginBO updateLoginUsername:self.usernameTextField.text password:self.passwordTextField.text];
    CDDLoginDataHandler *loginHandler = (CDDLoginDataHandler *)self.context.dataHandler;
    NSString *status = [loginHandler checkLoginUser];
    if (status.length) {
        self.statusLabel.text = status;
        if (self.statusLabel.hidden) {
            self.statusLabel.hidden = NO;
        }
        self.statusLabel.textColor = [UIColor redColor];
        [self.loginButton setBackgroundColor:[UIColor grayColor]];
    } else if (!self.statusLabel.hidden) {
        self.statusLabel.hidden = YES;
        [self.loginButton setBackgroundColor:self.tintColor];
    }
}

- (void)tapLoginButton
{
    CDDLoginDataHandler *loginHandler = (CDDLoginDataHandler *)self.context.dataHandler;
    BOOL isLogin = [loginHandler login];
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


@end
