//
//  YO.m
//  YO
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "YO.h"
#import "AFNetworking.h"

static NSString *YOKey;
static NSString *defaultUsername;

@implementation YO

+ (void)startWithAPIKey:(NSString *)APIKey
{
    YOKey = APIKey;
    defaultUsername = @"YO";
}

+ (void)sendYO
{
    NSString *path = @"http://api.justyo.co/yoall/";
    NSDictionary *parameters = @{@"api_token": YOKey};
    
	AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    [operationManager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"SUCCESS: Send a Yo to all subscribers");
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"FAILED: All Subscribers");
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sendYO) userInfo:nil repeats:NO];
        
    }];
}

+ (void)sendYOToIndividualUser:(NSString *)username_
{
    NSString *username = [[NSString alloc] init];
    if (!username_) {
        username = username_;
        defaultUsername = username_;
    }
    else {
        username = defaultUsername;
    }
    
    NSString *path = @"http://api.justyo.co/yoall/";
    NSDictionary *parameters = @{@"api_token": YOKey,
                                 @"username": username};
    
	AFHTTPRequestOperationManager *operationManager = [AFHTTPRequestOperationManager manager];
    [operationManager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"SUCCESS: Send a Yo to %@", username);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"FAILED: Individual users");
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sendYOToIndividualUser:) userInfo:nil repeats:NO];
        
    }];
}


@end
