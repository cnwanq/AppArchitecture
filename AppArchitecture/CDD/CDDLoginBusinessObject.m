//
//  CDDLoginBusinessObject.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "CDDLoginBusinessObject.h"

@interface CDDLoginBusinessObject()


@end

@implementation CDDLoginBusinessObject

- (void)updateLoginUsername:(NSString *)username password:(NSString *)password {
//    self.baseController.
    self.user.username = username;
    self.user.password = password;
}

#pragma mark - Getter/Setter

- (CDDUser *)user
{
    if (!_user) {
        _user = [CDDUser new];
    }
    return _user;
}


@end
