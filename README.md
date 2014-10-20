YO iOS SDK
======


A simple YO SDK for iOS

![Alt text](/YO-SDK-Demo.png?raw=true "Optional Title")

API Sign Up
======
http://yoapi.justyo.co/

How to Start
======
Drag YO folder into your project in Xcode. Include #import "YO.h"


How to Use
======
The following example will send a YO from **YIQIN2**. 

**If you want to recieve a YO from the example, add YIQIN2 as a friend in the app.**

In AppDelegate, include the following code in didFinishLaunchingWithOptions:
```Objective-C
    // Put your APIKey
    NSString *APIKey = @"20af1dd2-93af-869f-446c-0675f8694095";
    [YO startWithAPIKey:APIKey];
```

In your code:
```Objective-C
    // Send A Yo To All Subscribers
    [YO sendYO];
    
    // Yo Individual Usernames
    [YO sendYOToIndividualUser:@"YQ123456"];
    
    // Count Total Subscribers
    [YO countTotalSubscribers];
```

How to Contribute
======
1. Fork it.
2. Create your feature branch (git checkout -b new-feature).
3. Commit your changes (git commit -am 'Added new-feature').
4. Push to the branch (git push origin new-feature).
5. Create new Pull Request.
