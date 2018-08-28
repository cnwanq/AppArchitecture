//
//  MVVMUserVM.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVVMUserVM.h"

@implementation MVVMUserVM

- (instancetype)initWithUser:(MVVMUser *)user
{
    self = [super init];
    _username = user.username;
    _password = user.password;
    return self;
}

- (NSString *)verify
{
    NSString *msg = nil;
    if (self.username.length == 0) {
        msg = @"用户名为空";
    } else if (self.password.length == 0) {
        msg = @"密码为空";
    }
    return msg;
}

- (BOOL)login
{
    if ([self.username isEqualToString:@"klooker"] && [self.password isEqualToString:@"klook101"]) {
        return YES;
    }
    return NO;
}

@end
