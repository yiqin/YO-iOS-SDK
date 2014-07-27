//
//  ViewController.m
//  YO iOS SDK
//
//  Created by yiqin on 7/26/14.
//  Copyright (c) 2014 yiqin. All rights reserved.
//

#import "ViewController.h"
#import "YO.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)sendYOAction:(id)sender {
    [YO sendYOToIndividualUser:@"YIQIN1"];
    
    // Send A Yo To All Subscribers
    [YO sendYO];
    
    // [NSThread sleepForTimeInterval:2.0f];
    
    // Yo Individual Usernames
    // [YO sendYOToIndividualUser:@"YIQIN1"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
