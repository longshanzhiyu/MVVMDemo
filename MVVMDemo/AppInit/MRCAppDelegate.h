//
//  MRCAppDelegate.h
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 14/12/27.
//  Copyright (c) 2014年 leichunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MRCNavigationControllerStack.h"
#import "MRCViewModel.h"

@interface MRCAppDelegate : UIResponder <UIApplicationDelegate>

/// The window of current application.
@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong, readonly) MRCNavigationControllerStack *navigationControllerStack;

@end
