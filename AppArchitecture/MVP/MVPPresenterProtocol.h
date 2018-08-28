//
//  MVPPresenterProtocol.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MVPPresenterProtocol
- (void)attachView:(UIView *)view;
- (void)detachView;
@end
