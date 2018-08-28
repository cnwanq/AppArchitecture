//
//  MVPViewController.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVPViewController.h"
#import "MVPLoginPresenter.h"
#import "MVPLoginView.h"
#import <Masonry/Masonry.h>

@interface MVPViewController () <MVPLoginPresenterDelegate>

@property (nonatomic, strong) MVPLoginView *loginView;
@property (nonatomic, strong) MVPLoginPresenter *presenter;


@end

@implementation MVPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MVP";
    self.view.backgroundColor = [UIColor whiteColor];
    [self installViews];
}

- (void)installViews {
    self.loginView = [[MVPLoginView alloc] init];
    self.presenter = [[MVPLoginPresenter alloc] init];
    [self.presenter attachView:self.loginView];
    
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).with.offset(80);
        make.left.mas_equalTo(self.view);
        make.right.mas_equalTo(self.view);
    }];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}




@end
