//
//  MVCUser.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVCUser : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

- (instancetype)initWithUsername:(NSString *)username password:(NSString *)password;

- (BOOL)isExist;

@end
