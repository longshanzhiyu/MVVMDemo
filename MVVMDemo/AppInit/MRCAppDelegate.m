//
//  MRCAppDelegate.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 14/12/27.
//  Copyright (c) 2014年 leichunfeng. All rights reserved.
//

#import "MRCAppDelegate.h"
#import "MRCLoginViewModel.h"
#import "MRCHomepageViewModel.h"
#import "MRCViewModelServicesImpl.h"
#import "MRCNavigationController.h"

@interface MRCAppDelegate ()
@property (nonatomic, strong) MRCViewModelServicesImpl *services;
@property (nonatomic, strong) MRCViewModel *viewModel;
@property (nonatomic, strong, readwrite) MRCNavigationControllerStack *navigationControllerStack;

@end

@implementation MRCAppDelegate

#pragma mark - UIApplicationDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.services = [[MRCViewModelServicesImpl alloc] init];
    self.navigationControllerStack = [[MRCNavigationControllerStack alloc] initWithServices:self.services];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.services resetRootViewModel:[self createInitialViewModel]];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (MRCViewModel *)createInitialViewModel {
    // The user has logged-in.
    if ([SSKeychain rawLogin].isExist && [SSKeychain accessToken].isExist) {
        // Some OctoKit APIs will use the `login` property of `OCTUser`.
//        OCTUser *user = [OCTUser mrc_userWithRawLogin:[SSKeychain rawLogin] server:OCTServer.dotComServer];
//
//        OCTClient *authenticatedClient = [OCTClient authenticatedClientWithUser:user token:[SSKeychain accessToken]];
//        self.services.client = authenticatedClient;
        
        return [[MRCHomepageViewModel alloc] initWithServices:self.services params:nil];
    } else {
        return [[MRCLoginViewModel alloc] initWithServices:self.services params:nil];
    }
}

@end
