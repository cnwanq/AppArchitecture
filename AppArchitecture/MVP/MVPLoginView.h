//
//  MVPLoginView.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MVPUser.h"

@protocol MVPLoginViewDelegate <NSObject>

//- (void)changeUsername:(NSString *)username;
//- (void)changePasswrod:(NSString *)password;
- (void)tapLoginButton;


@end

@interface MVPLoginView : UIView

@property (nonatomic, strong) MVPUser *user;
@property (nonatomic, weak) id<MVPLoginViewDelegate> delegate;

- (void)showLoginSucess;
- (void)showLoginFailedWith:(NSString *)msg;


@end
