//
//  CDDLoginBusinessObjectProtocol.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#ifndef CDDLoginBusinessObjectProtocol_h
#define CDDLoginBusinessObjectProtocol_h

@protocol CDDLoginBusinessObjectProtocol <NSObject>

- (void)updateLoginUsername:(NSString *)username password:(NSString *)password;

@end


#endif /* CDDLoginBusinessObjectProtocol_h */
