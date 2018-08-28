//
//  MVCViewController.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVCViewController.h"
#import "MVCUser.h"

@interface MVCViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@property (nonatomic, strong) MVCUser *user;

@end

@implementation MVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"MVC";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self configLoginButton];
}

- (IBAction)usernameEditChangeHandle:(UITextField *)sender {
    [self hideStatusLabel];
    [self configLoginButton];
}

- (IBAction)passwordEditChange:(UITextField *)sender {
    [self hideStatusLabel];
    [self configLoginButton];
}

- (IBAction)loginHandle:(id)sender {
    [self.view endEditing:YES];
    NSString *username = self.usernameTextField.text;
    NSString *password = self.passwordTextField.text;
    if ([self checkLoginWithUsername:username password:password]) {
//        NSLog(@"登录成功");
        [self handleLoginSuccess:YES];
    } else {
//        NSLog(@"登录失败");
        [self handleLoginSuccess:NO];
    }
}

- (void)handleLoginSuccess:(BOOL)success {
    if (success) {
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

- (void)hideStatusLabel {
    if (!self.statusLabel.hidden) {
        self.statusLabel.hidden = YES;
    }
}

- (void)changeLoginButtonWithUsername:(NSString *)username password:(NSString *)password {
    BOOL enable = NO;
    if (username.length && password.length) {
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

- (void)configLoginButton {
    
    [self changeLoginButtonWithUsername:self.usernameTextField.text password:self.passwordTextField.text];
    
}

- (BOOL)checkLoginWithUsername:(NSString *)username password:(NSString *)password {
    BOOL isLoginSuccess = NO;
    self.user = [[MVCUser alloc] initWithUsername:username password:password];
    isLoginSuccess = [self.user isExist];
    return isLoginSuccess;
}





@end
