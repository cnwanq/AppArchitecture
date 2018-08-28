//
//  CDDLoginDataHandler.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "CDDLoginDataHandler.h"
#import "CDDLoginBusinessObject.h"

@interface CDDLoginDataHandler ()

@property (nonatomic, strong) CDDUser *user;

@end;

@implementation CDDLoginDataHandler

- (NSString *)checkLoginUser {
    
    NSString *msg = nil;
    CDDUser *user = self.user;
    if (user.username.length == 0) {
        msg = @"用户名为空";
    } else if (user.password.length == 0) {
        msg = @"密码为空";
    }
    return msg;

}

- (BOOL)login {
    CDDUser *user = self.user;
    if ([user.username isEqualToString:@"klooker"] && [user.password isEqualToString:@"klook101"]) {
        return YES;
    }
    return NO;
}

#pragma mark - Getter/Setter

- (CDDUser *)user {
    CDDLoginBusinessObject *loginBO = (CDDLoginBusinessObject *)self.weakContext.businessObject;
    CDDUser *user = loginBO.user;
    return user;
}

@end
