//
//  MVCUser.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVCUser.h"

@implementation MVCUser

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password
{
    self = [super init];
    _username = username;
    _password = password;
    return self;
}

- (BOOL)isExist
{
    if ([self.username isEqualToString:@"klooker"] && [self.password isEqualToString:@"klook101"]) {
        return YES;
    }
    return NO;
}

@end
