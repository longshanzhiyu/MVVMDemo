//
//  MRCLoginViewModel.h
//  MVVMDemo
//
//  Created by njw on 2019/3/14.
//  Copyright © 2019 njw. All rights reserved.
//

#import "MRCViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MRCLoginViewModel : MRCViewModel
/// The avatar URL of the user.
@property (nonatomic, copy, readonly) NSURL *avatarURL;

/// The username entered by the user.
@property (nonatomic, copy) NSString *username;

/// The password entered by the user.
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong, readonly) RACSignal *validLoginSignal;

/// The command of login button.
@property (nonatomic, strong, readonly) RACCommand *loginCommand;

/// The command of uses browser to login button.
@property (nonatomic, strong, readonly) RACCommand *browserLoginCommand;
@property (nonatomic, strong, readonly) RACCommand *exchangeTokenCommand;
@end

NS_ASSUME_NONNULL_END
