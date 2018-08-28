//
//  CDDLoginBusinessObject.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CDDContext.h"
#import "CDDLoginBusinessObjectProtocol.h"
#import "CDDUser.h"

@interface CDDLoginBusinessObject : CDDBusinessObject <CDDLoginBusinessObjectProtocol>

@property (nonatomic, strong) CDDUser *user;

@end
