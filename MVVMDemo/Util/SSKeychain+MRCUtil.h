//
//  SSKeychain+MRCUtil.h
//  MVVMDemo
//
//  Created by njw on 2019/3/18.
//  Copyright © 2019 njw. All rights reserved.
//

#import "SSKeychain.h"

NS_ASSUME_NONNULL_BEGIN

@interface SSKeychain (MRCUtil)
+ (NSString *)rawLogin;
+ (NSString *)password;
+ (NSString *)accessToken;

+ (BOOL)setRawLogin:(NSString *)rawLogin;
+ (BOOL)setPassword:(NSString *)password;
+ (BOOL)setAccessToken:(NSString *)accessToken;

+ (BOOL)deleteRawLogin;
+ (BOOL)deletePassword;
+ (BOOL)deleteAccessToken;
@end

NS_ASSUME_NONNULL_END
