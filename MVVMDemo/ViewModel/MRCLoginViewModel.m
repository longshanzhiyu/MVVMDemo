//
//  MRCLoginViewModel.m
//  MVVMDemo
//
//  Created by njw on 2019/3/14.
//  Copyright © 2019 njw. All rights reserved.
//

#import "MRCLoginViewModel.h"
#import "MRCHomepageViewModel.h"
#import "Client.h"

@interface MRCLoginViewModel ()

@property (nonatomic, copy, readwrite) NSURL *avatarURL;

@property (nonatomic, strong, readwrite) RACSignal *validLoginSignal;
@property (nonatomic, strong, readwrite) RACCommand *loginCommand;
@property (nonatomic, strong, readwrite) RACCommand *browserLoginCommand;
@property (nonatomic, strong, readwrite) RACCommand *exchangeTokenCommand;

@end

@implementation MRCLoginViewModel

- (void)initialize {
    [super initialize];
    
    
    RAC(self, avatarURL) = [[RACObserve(self, username) map:^id _Nullable(id  _Nullable value) {
        return [NSURL URLWithString:@"http://172.20.244.117/upload/testuser.png"];
    }] distinctUntilChanged];
    
    self.validLoginSignal = [[RACSignal
                              combineLatest:@[ RACObserve(self, username), RACObserve(self, password) ]
                              reduce:^(NSString *username, NSString *password) {
                                  return @(username.length > 0 && password.length > 0);
                              }]
                             distinctUntilChanged];
    
    @weakify(self)
    void (^doNext)(Client *) = ^(Client *authenticatedClient){
        @strongify(self)
        authenticatedClient.user = [User new];
        [[MRCMemoryCache sharedInstance] setObject:authenticatedClient.user forKey:@"currentUser"];
        
        self.services.client = authenticatedClient;
        MRCHomepageViewModel *viewModel = [[MRCHomepageViewModel alloc] initWithServices:self.services params:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.services resetRootViewModel:viewModel];
        });
    };
    
    self.loginCommand = [[RACCommand alloc] initWithSignalBlock:^(NSString *oneTimePassword) {
        
        doNext([Client new]);
        return [[RACSignal defer:^RACSignal * _Nonnull{
            return [RACSignal empty];
        }] doNext:doNext];
    }];
    
    self.exchangeTokenCommand = [[RACCommand alloc] initWithSignalBlock:^(NSString *code) {
        return [RACSignal new];
    }];
}

- (void)setUsername:(NSString *)username {
    _username = [username stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
