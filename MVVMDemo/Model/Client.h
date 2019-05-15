//
//  Client.h
//  MVVMDemo
//
//  Created by njw on 2019/3/20.
//  Copyright © 2019 njw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface Client : NSObject
@property (nonatomic, strong) User *user;
@end

NS_ASSUME_NONNULL_END
