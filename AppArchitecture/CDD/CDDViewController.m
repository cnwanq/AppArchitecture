//
//  CDDViewController.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "CDDViewController.h"
#import "CDDLoginView.h"
#import <Masonry/Masonry.h>
#import "CDDLoginBusinessObject.h"
#import "CDDLoginDataHandler.h"
#import "NSObject+CDD.h"

@interface CDDViewController ()

@property (nonatomic, strong) CDDLoginView *loginView;
@property (nonatomic, strong) CDDUser *user;

@end

@implementation CDDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"CDD";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initContext];
    
    [self installViews];
}

- (void)initContext {
    
    CDDLoginDataHandler *loginDataHandler = [[CDDLoginDataHandler alloc] init];
    CDDLoginBusinessObject *loginBusinessObject = [[CDDLoginBusinessObject alloc] init];
    CDDUser *user = [CDDUser new];
    loginBusinessObject.user = user;
    
    self.context = [[CDDContext alloc] initWithDataHandler:loginDataHandler withBusinessObject:loginBusinessObject];
    
}

- (void)installViews {
    self.loginView = [[CDDLoginView alloc] init];
    self.loginView.context = self.context;
    [self.loginView checkState];
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(80);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
}

@end
