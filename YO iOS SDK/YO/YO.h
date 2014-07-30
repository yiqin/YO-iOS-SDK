//
//  YO.h
//  YO
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//


@interface YO : NSObject

+ (void) startWithAPIKey: (NSString *) APIKey;

+ (void) sendYO;
+ (void) sendYOToIndividualUser: (NSString *) username;
+ (void) countTotalSubscribers;

@end
