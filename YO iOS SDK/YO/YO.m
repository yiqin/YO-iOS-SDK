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

@implementation YO

+ (void)startWithAPIKey:(NSString *)APIKey
{
    YOKey = APIKey;
}

+ (void)sendYO
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YO SDK"
                                                    message:@"SUCCESS: Send A Yo To All Subscribers"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    NSString *path = @"http://api.justyo.co/yoall/";
    NSDictionary *parameters = @{@"api_token": YOKey};
    
	AFHTTPRequestOperationManager *operationManager1 = [AFHTTPRequestOperationManager manager];
	operationManager1.requestSerializer = [AFJSONRequestSerializer serializer];
    operationManager1.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [operationManager1 POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"SUCCESS: Send A Yo To All Subscribers");
        [alert show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"FAILED");
    }];
}

+ (void)sendYOToIndividualUser:(NSString *)username
{
    NSString *temp = [NSString stringWithFormat: @"SUCCESS: Send A Yo to %@", username];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"YO SDK"
                                                    message:temp
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    NSString *path = @"http://api.justyo.co/yoall/";
    NSDictionary *parameters = @{@"api_token": YOKey,
                                 @"username": username};
    
	AFHTTPRequestOperationManager *operationManager1 = [AFHTTPRequestOperationManager manager];
	operationManager1.requestSerializer = [AFJSONRequestSerializer serializer];
    operationManager1.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [operationManager1 POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"SUCCESS: Send A Yo to %@", username);
         [alert show];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
		NSLog(@"FAILED");
    }];
}

@end
