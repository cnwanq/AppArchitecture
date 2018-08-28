//
//  CDDLoginDataHandlerProtocol.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#ifndef CDDLoginDataHandlerProtocol_h
#define CDDLoginDataHandlerProtocol_h

@protocol CDDLoginDataHandlerProtocol <NSObject>

- (NSString *)checkLoginUser;
- (BOOL)login;

@end

#endif /* CDDLoginDataHandlerProtocol_h */
