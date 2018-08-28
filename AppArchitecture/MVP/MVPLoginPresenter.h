//
//  MVPPresenter.h
//  AppArchitecture
//
//  Created by wanqijian on 2018/8/27.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MVPPresenterProtocol.h"
#import "MVPUser.h"
#import "MVPLoginView.h"

@protocol MVPLoginPresenterDelegate <NSObject>


@end

@interface MVPLoginPresenter : NSObject <MVPPresenterProtocol>

@property (nonatomic, weak) MVPLoginView *view;


@end
