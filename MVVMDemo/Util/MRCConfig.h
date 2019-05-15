//
//  MRCConfig.h
//  MVVMDemo
//
//  Created by njw on 2019/3/13.
//  Copyright © 2019 njw. All rights reserved.
//

#ifndef MRCConfig_h
#define MRCConfig_h

///------------
/// AppDelegate
///------------

#define MRCSharedAppDelegate ((MRCAppDelegate *)[UIApplication sharedApplication].delegate)

///------------
/// Client Info
///------------

#define MRC_CLIENT_ID     @"ef5834ea86b53233dc41"
#define MRC_CLIENT_SECRET @"6eea860464609635567d001b1744a052f8568a99"

///-----------
/// SSKeychain
///-----------

#define MRC_SERVICE_NAME @"com.leichunfeng.MVVMReactiveCocoa"
#define MRC_RAW_LOGIN    @"RawLogin"
#define MRC_PASSWORD     @"Password"
#define MRC_ACCESS_TOKEN @"AccessToken"

///-----------
/// URL Scheme
///-----------

#define MRC_URL_SCHEME @"mvvmreactivecocoa"

///----------------------
/// Persistence Directory
///----------------------

#define MRC_DOCUMENT_DIRECTORY NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject

#endif /* MRCConfig_h */
