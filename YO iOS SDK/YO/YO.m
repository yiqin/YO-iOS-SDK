//
//  YO.m
//  YO
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "YO.h"

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
    NSString *API_KEY = YOKey;

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:@"http://api.justyo.co/yoall/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary *mapData = @{@"api_token": API_KEY};
    NSError *error = [[NSError alloc] init];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        int statusCode = [(NSHTTPURLResponse*) response statusCode];
        NSLog(@"%i", statusCode);
        
        if (statusCode == 201) {
            NSLog(@"SUCCESS: Send A Yo to all subscribers.");
        }
        else {
            NSLog(@"FAIL");
            [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sendYO) userInfo:nil repeats:NO];
        }
    }];
    
    [postDataTask resume];
}

+ (void)sendYOToIndividualUser:(NSString *)username_
{
    NSString *API_KEY = YOKey;
    
    NSString *username = [[NSString alloc] init];
    if (!username_) {
        username = username_;
        defaultUsername = username_;
    }
    else {
        username = defaultUsername;
    }
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURL *url = [NSURL URLWithString:@"http://api.justyo.co/yoall/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:60.0];
    
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPMethod:@"POST"];
    
    NSDictionary *mapData = @{@"api_token": API_KEY,
                              @"username" : username};
    NSError *error = [[NSError alloc] init];
    NSData *postData = [NSJSONSerialization dataWithJSONObject:mapData options:0 error:&error];
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        int statusCode = [(NSHTTPURLResponse*) response statusCode];
        NSLog(@"%i", statusCode);
        
        if (statusCode == 201) {
            NSLog(@"SUCCESS: Send A Yo to %@", username);
        }
        else {
            NSLog(@"FAIL");
            [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(sendYOToIndividualUser:) userInfo:nil repeats:NO];
        }
    }];
    
    [postDataTask resume];
}


@end
