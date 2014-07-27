YO iOS SDK
======

A simple YO SDK for iOS


Usage
======
In AppDelegate, includes the following code in didFinishLaunchingWithOptions:

    // Put your APIKey
    NSString *APIKey = @"20af1dd2-93af-869f-446c-0675f8694095";
    [YO startWithAPIKey:APIKey];


In your code:

    // Send A Yo To All Subscribers
    [YO sendYO];
    
    // Yo Individual Usernames
    [YO sendYOToIndividualUser:@"THE USERNAME YOU WANT TO SEND"];


