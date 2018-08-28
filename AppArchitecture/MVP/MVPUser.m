//
//  MVPUser.m
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "MVPUser.h"

@implementation MVPUser

- (BOOL)isExist
{
    if ([self.username isEqualToString:@"klooker"] && [self.password isEqualToString:@"klook101"]) {
        return YES;
    }
    return NO;
}

@end
