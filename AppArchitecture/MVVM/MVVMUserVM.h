//
//  MVVMUserVM.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/26.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMUser.h"

@interface MVVMUserVM : NSObject

//@property (nonatomic, strong) MVVMUser *user;

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

- (instancetype)initWithUser:(MVVMUser *)user;

- (NSString *)verify;

- (BOOL)login;

@end
